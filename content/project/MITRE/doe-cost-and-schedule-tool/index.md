---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Department of Energy Cost and Schedule Tool"
summary: "Built a tool to determine changes to cost and schedule"
authors: 
  - admin
tags: 
  - MITRE
categories: 
  - Data Visualization
  - JavaScript
  - Operations Research
  - Discrete Event Simulation
date: 2016-04-01T19:26:57-05:00

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

Developed a discrete simulation model capable of performing lifecycle cost and schedule analysis. This model supports executives that make decisions on alternative strategies which are expected to cost on the order of tens of billions of dollars. The model, built entirely in JavaScript using SIM.JS, allows users to configure the schedule and efficiency of each alternative. After the model completes, results are displayed using a combination of D3 and TimelineJS libraries.