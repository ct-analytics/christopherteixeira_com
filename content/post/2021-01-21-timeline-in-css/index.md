---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Timeline in CSS"
subtitle: "Creating a timeline "
summary: ""
authors: 
  - admin
tags: 
  - Other
categories: 
  - HTML
  - SASS
  - CSS
date: 2021-01-21T20:30:30-05:00
lastmod: 2021-01-21T20:30:30-05:00
featured: false
draft: true

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
projects: 
  - website
---

In setting up this website, I really liked the way that the [Academic theme](#) laid out the [experience section](#). Above, you can see how this looks, laying out cards for each step in my career similar to how LinkedIn represents roles and positions. I find this can be good for leaving a bit of detail behind each step given that a card can easily display a paragraph or two. However, for slides and documents, this was a bit harder to summarize. 

In crafting some slides using [revealjs](#), I sought a way to represent my history in a single slide using a means that was more appealing than a series of bullets. In particular, this had to use either markdown or some combination of HTML, CSS, and JS. A bit of googling brought me to this [example timeline](https://codepen.io/cjl750/pen/MXvYmg) built using just HTML and SASS (a preprocessor for CSS). It's simple and compressible to a single slide, exactly what I needed.

{{< figure library="true" src="/timeline/career_timeline.png" title="Chris Teixeira's Career Timeline" >}}

