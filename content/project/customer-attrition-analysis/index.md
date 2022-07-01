---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Customer Attrition Analysis"
summary: "Using machine learning to predict which accounts are likely to be closed."
authors: 
  - admin
tags: 
  - Epsilon
categories: 
  - Machine Learning
  - Netezza
  - R
date: 2012-12-01T19:26:45-05:00

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: "Smart"
  preview_only: false

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

I worked with team members to build a Bayesian Belief Network (BBN) on large data sources in Netezza to predict the likelihood of a person closing an account with our client. I compared the BBN model results against Logistic Regression to determine best modeling approach. The results showed that the Logistic Regression approach provided more accurate results, but required more resources to get that result.