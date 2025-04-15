---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "MLB Player Similarity"
summary: "Using stats to determine how similar baseball players are to each other."
authors: 
  - admin
tags: 
  - Other
categories: 
  - Machine Learning
  - Operations Research
  - R
date: 2013-06-01T19:27:49-05:00

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

Using a combination of dynamic programming and social network analysis, I compare a player's career stats against other players to figure out who are the most similar. After determining which players are similar, I use various social network analysis techniques to be able to cluster and categorize players.