---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Cost of Hosting a Shiny Server on AWS"
subtitle: ""
summary: "After setting up a shiny server, I watched how much it cost and was quite surprised."
authors: 
- admin
tags: 
- Other
categories: 
- R
- AWS
date: 2022-07-03T20:21:53-04:00
lastmod: 2022-07-03T20:21:53-04:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: ["website"]
---

As you might have guessed, I run this website for fun. It's a hobby that doesn't earn me any extra money. As such, I track the costs using AWS Cost Explorer to understand how much money I'm likely to pay for this hobby. AWS Cost Explorer lets you explore the costs for all of your AWS services on an hourly, daily, or monthly level.

This isn't a very popular site, so I just casually review the daily totals and monitor the monthly costs. Most of the time, my daily costs are pretty minimal, with a monthly total around $1.10 (and an annual charge of $24). This is usually broken out by a combination of costs for Route 53 and S3 costs.

Setting up a Shiny server wasn't too hard as you can read about in a previous post. There are a few different AWS services I could have used to do this, but went with a combination of EC2 services to run my Shiny server. However, I didn't know what to expect for costs to run a service in this way. I decided to sit back and watch it to see how much it would costs. AWS Cost Explorer broke out costs into a bunch of categories. Below is a chart of the daily costs over a little more than a couple months.

<!-- 
| **Service**      | **Cost** |
|------------------|:--------:|
| EC2-ELB          |    $1.08 |
| EC2-Instances    |    $0.28 |
| EC2-Other        |    $0.20 |
| Route 53         |    $0.00 |
| Cost Explorer    |    $0.00 |
| CloudFront       |    $0.00 |
| S3               |    $0.00 |
| SES              |    $0.00 |
| Lambda           |    $0.00 |
| CloudWatch       |    $0.00 |

{{< chart data="chart" >}} 
-->
{{< chart data="AWS Costs" >}}

As you can see in that chart, just hosting this website amounted to about $0.005 per day. As I spun up different services, you can see the costs start to rise. Once I figured out the settings I wanted, the daily costs were around $1.557 per day. That doesn't sound horrible, but even that little amount per day can add up over the course of a month. Either way, it was a bit much for this part of my hobby so I decided to shut things down.
