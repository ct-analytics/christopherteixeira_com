---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Updating the email forwarding on AWS SES"
subtitle: ""
summary: "Swithing from JavaScript to Python for my SES forwarding and setting up for a better spam filter."
authors: 
- admin
tags: 
- Other
categories: 
- Python
- AWS
date: 2024-04-05T00:00:00-04:00
lastmod: 2024-04-07T00:00:00-04:00
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

It's been awhile since I've looked at the email forwarding I set up in [this post]({{< relref "post/2020-07-30-setting-up-an-email-using-aws" >}}). In general, it's been working fine so why change it? Well, the last couple of months has introduced more and more spam into my account. I took this opportunity to simplify the code, convert to a language I'm more familiar with (Python), and set up to introduce a custom spam filter.

Let's take a look at what exists now:

```mermaid
graph LR
  email(Incoming email) --> SES(Simple Email Service)

  subgraph AWS[fab:fa-aws Amazon Web Services]
    SES --> S3(S3 Bucket)
    SES --> Lambda(Lambda Javascript Function)
    Lambda --> SES
  end

  SES --> gmail(fab:fa-google Gmail)
```
