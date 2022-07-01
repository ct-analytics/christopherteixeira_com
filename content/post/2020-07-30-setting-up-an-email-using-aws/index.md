---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Setting up a personal email address using AWS"
subtitle: ""
summary: "It's not straight forward to set up a professional email using AWS and another email client."
authors: 
- admin
tags: 
- Other
categories: 
- AWS
date: 2020-07-30T19:24:11-05:00
lastmod: 2021-01-18T19:24:11-05:00
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

## Background

If you haven't followed my other posts, this website was created using [blogdown](https://bookdown.org/yihui/blogdown/) in R. While building this site though, I decided to go off track in the tutorial to host it via Amazon Web Services (AWS) via their S3 buckets. It's a pretty straight forward process with a [detailed tutorial](https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html) on hosting a static website. 

What was less straight forward was setting up an email address to use with this website. This post will outline the major steps I took and aim at providing others with tips to follow for creating a professional email address to go with your website. 

## Getting the email address

If you followed the tutorial for setting up a static website, then you not only have a public S3 bucket, but also a domain registered using Route 53 or a similar service. The next step is to explore AWS Simple Email Service or SES. Like other AWS services, you can do this via the AWS CLI tools or their browser. I used their browser interface for this but replicated the steps using CLI just to see if it felt any easier. 

If you follow the AWS tutorials like [this one](https://aws.amazon.com/getting-started/hands-on/send-an-email/), it sounds incredibly simple: just create one, verify it, and open your email client to receive it. However, in order to verify your email you first need to have the ability to receive and store emails that by default won't be available with a custom email. I did this inside another S3 bucket but you can do this in a number of ways.

Before you actually create the email, you need a rule set for receiving the email. This [page](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html) details gives you the steps and tips to consider. For me, it was simple enough to just list the domain as a recipient and determine the specific email later.

Finally, you're ready to verify the email. This requires setting up the email, clicking verify, going to the folder you identified in the corresponding S3 bucket, and making sure a file appeared there. If it did, then you can open and copy+paste the link into your browser to finish verifying the email address.

## Using your email address

By default, this email address you just created is in the AWS SES sandbox. You can email anyone you have verified in here but for most practical purposes this won't be sufficient. I want to be able to email anyone from this address using something like Spark. The next step is then to file a support ticket to do this. This [page](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/request-production-access.html) gives you the details and I found it incredibly quick (about 10 hours) for them to review and approve this transaction. 

Next step is to set up credentials for an SMTP server so you can retrieve and send emails using something other than AWS. This [page](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/smtp-credentials.html) outlines the steps for getting your credentials. This is a key step, do not lose those credentials!

Various email clients and services might have slightly different steps, but I like using Spark for managing my many inboxes. They give you several options, from setting up a new [inbox](https://sparkmailapp.com/help/141-add-more-email-accounts-to-spark.html) to setting up an [alias](https://sparkmailapp.com/help/154-set-up-an-email-alias.html).

Once that's completed, you should be good to start sending emails! However, receiving emails is a slightly different story. Having the SMTP is only part of the answer as you'll see. Receiving emails from unverified email addresses requires an extra step that requires setting up a function to forward incoming emails to the email associated with your alias. Luckily, this website outlines it all for you so head over to the traveling squid and read his posts [part 1](https://thetravellingsquid.com/2019/05/27/send-emails-with-gmail-using-amazon-simple-email-service/) and [part 2](https://thetravellingsquid.com/2019/05/30/domain-specific-email-on-gmail-with-amazon-ses/). 

Next post will be around setting up a professional looking signature for your email.