---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Setting up a Shiny Server using only AWS services"
subtitle: ""
summary: "My adventures in setting up a shiny server using AWS and hugo. "
authors: 
- admin
tags: 
- Other
categories: 
- AWS
- R
- Linux
- HTML
- Docker
date: 2021-08-28T07:37:02-04:00
lastmod: 2021-08-28T07:37:02-04:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: true

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: ["website"]
---

## Background
With the oncoming fantasy football season, I wanted to spin up a simple RShiny application (or app) for looking at fantasy football data. Luckily, there's several packages on scraping and analyzing data but the first step was getting the infrastructure in place. I took this as an opportunity to practice my skills in setting up RShiny using docker containers and hosting on AWS. However, as with all projects, I hit some road blocks and figure it would be worth sharing my solutions with others in case they're trying to figure out what might have gone wrong.

## Setting up EC2
My first step was getting the raw infrastructure. Since I've been working in AWS, I went with just standing up an EC2 instance. There are several guides out there, although I followed the basic Amazon tutorial they posted.[^1] I went with Ubuntu and whatever size was free so I could at least get something working. 

### Docker Container vs. VM
Once the VM was set up and I could connect to it, the next question was: what do I want to install? I've set up plenty of VMs (or images on my raspberry pi's) so I figure why not use a bit of extra practice with docker containers. Luckily there's a couple of different containers that could be pretty useful to use for my RShiny application. This container[^2] has a lot of useful tips for getting started however, I wanted to add in a few other packages. I simply built out a custom Dockerfile that would add in the necessary linux libraries in addition to the packages I required on top of the rocker/shiny image. Here's my Dockerfile[^3]:

```dockerfile
FROM rocker/shiny-verse:latest

RUN apt-get update -qq \
    && apt-get -y --no-install-recommends install \
        apt-utils \
        libgdal-dev \
        pkg-config \
        libudunits2-dev \
    && install2.r --error --deps TRUE \
        shiny \
        shinydashboard \
        shinythemes \
        ggplot2 \
        ggthemes \
        lubridate \
        DT \
        dplyr \
        shinyjs \
        patchwork \
        bslib \
        thematic \
        ffsimulator \
        ffscrapr 
        
COPY index.html /srv/shiny-server/
```

Pretty straight forward, however, I added the HTML file at the end to replace the default RShiny Server homepage. We'll talk about that more in a moment. Next step was to add in a line to my `.profile` file that would kick off the container anytime the server was rebooted. Here's the simple line, building in a condition in case the container was stopped randomly:

```bash
if [ ! "$(docker ps -q -f name=shiny_srv)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=shiny_srv)" ]; then
        # cleanup
        docker rm shiny_srv
    fi
    # run your container
    # docker run -d --name <name> my-docker-image
    sudo docker container run -d -p 80:3838 --name shiny_srv \
        -v /home/ubuntu/FantasyFootballOptimization/:/srv/shiny-server/FantasyFootballOptimization \
        -v /home/ubuntu/log/shiny-server/:/var/log/shiny-server/ \
        feasibleanalytics/ffsimulator-shiny
fi
```

Note I'm mounting a couple volumes for the app itself and a directory to host the logs for when the app eventually crashes. At this point, the container is running and you can test it by going to the Public IPv4 DNS on your AWS EC2 instance page. Note most browsers will prefix your url with "https" which will not work since we're pushing to port 80. 

Next step is to procure TSL certificates so we can secure our app. We could use one of many free TSL certification managers (e.g., [let's encrypt](https://letsencrypt.org/])) and [NGINX](https://www.nginx.com/) to provide a secure access to my shiny server (i.e., using https instead of http) but let's stick to using AWS services. 

## Load balancer
The most straight forward approach I saw was to use a combination of EC2 features and AWS Certification manager to secure my shiny server. Once I set up a certificate following [these instructions](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html), I was ready to set up a load balancer that can help prevent my shiny server from crashing and utilize those certificates to create a secure connection. 

Setting a load balancer was pretty straight forward, but there were two sets of instructions. First, consider getting an elastic IP address for your server. This is incredibly helpful in case you ever want to switch EC2 instances in the future without breaking too much. This [site](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html) has more than enough info to consider in setting up your elastic IP address. Next up, follow the instructions on this [site](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-application-load-balancer.html) for the load balancer. We're nearly there, except its not actually accepting incoming requests on the HTTPS port. This part was a little tricky, but luckily AWS listed the instructions [here](https://aws.amazon.com/premiumsupport/knowledge-center/elb-redirect-http-to-https-using-alb/). 

At this point, I have everything up and working, and it can be verified by using the load balancer DNS name. I did have a warning that the site wasn't secure because I set up the TSL certificate to point to a subdomain on my website and not this random DNS name from the load balancer. If that successfully loads your shiny server app, I was ready to go over to Route 53 and create a record pointing to this DNS name. I went to my website hosted zone, created a new record pointing to a subdomain (shiny) for my site, checked alias and entered all the necessary information. This [site](https://aws.amazon.com/premiumsupport/knowledge-center/route-53-create-alias-records/) details the information you'll need.

## Connecting to Hugo

At this point, my shiny server is up and running but its separate from my website (even though it's linked as a subdomain). I wanted to link the two together through creating a list of apps using Hugo and Wowchemy. This was rather easy but required two different parts:

1. Create an index of shiny apps
2. Forward any requests to shiny.christopherteixeira.com to the index of shiny apps

First I created a list of shiny apps. This is a bit manual, but using a list of projects and external links allows me to create a pretty nice index of apps. That means when someone clicks on a "project" it will just load the app automatically.[^4]

For step 2, I created a simple index.html file that redirects requests to the page with the list of apps on my website. This code is pretty straight forward and can break if your browser doesn't allow redirects. I might eventually duplicate the hugo portfolio widget or create a more elegant solution but for now this worked for me.

```html
<!DOCTYPE html> 
<html> 
  
<head> 
    <title>Redirect to Shiny App Listing</title> 
    <meta http-equiv="refresh" content="0; url = https://christopherteixeira.com/shinyapps" /> 
</head> 
  
<body>
    <p style="text-align:center;"> 
        If your browser supports fefresh, you'll be redirected to a listing of my Shiny apps in 0 seconds. 
    </p> 
</body> 
  
</html> 
```

That's about it for setting up shiny server on AWS for now. My next post will likely be in a few months once I'm able to average out the cost of this solution. I also want to explore the cost of using EC2 versus using AWS container services.

[^1]: This [tutorial](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html) has quite a bit of information to get started with on setting up a virtual machine. For data science applications, or simply working on a budget, Towards Data Science has a great [post](https://towardsdatascience.com/aws-ec2-for-beginners-56df2e820d7f) for beginners. 
[^2]: There are a few containers to pick from in running shiny. I'd recommend picking either [shiny](https://hub.docker.com/r/rocker/shiny) or [shiny-verse](https://hub.docker.com/r/rocker/shiny-verse) from rocker. In general, [rocker](https://hub.docker.com/u/rocker) has several containers posted that are great for programming in R if you're looking for other applications. 
[^3]: For the latest versions, please pull from [dockerhub](https://hub.docker.com/r/feasibleanalytics/ffsimulator-shiny). 
[^4]: This step is a little involved but first required creating a [portfolio widget](https://wowchemy.com/docs/widget/portfolio/) and then [adding in projects](https://wowchemy.com/docs/content/projects/). 