---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Children at Risk Research"
summary: "Using analytics to determine risk factors associated with child fatalities."
authors: 
  - admin
tags: 
  - MITRE
categories: 
  - Machine Learning
  - R
date: 2015-12-01T19:26:32-05:00

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: "#StopChildAbuse"
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

The Children at Risk research project looks at which information is important at determining which children under the age of ten are at higher risk for fatality due to abuse and neglect. Leading a small team, we've collected data from multiple parts of a local Health and Human Services Agency to bring together and understand some of the data quality issues that might exist in other HHS agencies. We use R (specifically the CARET library) to identify which factors are the most important in determining children who are at higher risk due to fatality. Using this information, we hope to design a data visualization tool that will help caseworkers identify those children at higher risk of fatality due to abuse and neglect.