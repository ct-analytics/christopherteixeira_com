---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Optimizing Team Assignments"
summary: "Creating fair and equal softball teams"
authors: 
  - admin
tags: 
  - GMU
  - Other
categories: 
  - Operations Research
  - Java
date: 2010-08-01T19:28:00-05:00

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

The teams in the Northern Virginia Senior Softball (NVSS) league are reorganized every year with the desire to make them as even as possible and promote social interactions. This project’s goals were to develop a methodology to produce team assignments for players such that the teams are equal in regards to player ability and other attributes. Multiple regression was employed to obtain offensive, defensive, and team metrics. An integer program (IP) model was developed where constraints were aligned with the goals of the NVSS league to solve the assignment problem. The IP model was linked to a team assignment tool which allows the user to select settings and parameters before running the model.