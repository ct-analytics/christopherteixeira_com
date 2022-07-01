---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Simulating a baseball game"
subtitle: ""
summary: "Using R and Dynamic Programming to simulate a baseball game."
authors: 
- admin
tags: 
- Other
- MLB
categories: 
- Operations Research
- R
date: 2020-08-11T19:23:30-05:00
lastmod: 2021-01-18T19:23:30-05:00
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
projects: []
---

## Background

As many of you know, I'm an avid baseball fan. Therefore, whenever I come across a topic involving Operations Research and baseball, I can't just simply ignore it. Awhile ago, I discovered this website that analyzes the strategies of a team throughout a baseball game. It's an interesting approach that uses dynamic programming to maximize the probability of winning the overall game by breaking up each inning into the various situations that are possible and then picking the optimal strategy for that situation.

My first reaction was, "Cool! I want to play with it!" But wait, it's in MATLAB?! I don't have MATLAB at home. I had a couple of options, I could try and get a copy of MATLAB (which is not very cheap) or translate to a language I had access to on my laptop. I thought about R, Python, or potentially learning Octave but eventually sided with R. Below are links to the Git that has the translated code in R. Note that this version is strictly a translation and has not been optimized for the R language.

## Future work

This is really a work in progress since I'd like to build it out a bit. Here's what I see as future work I hope to accomplish on this problem:

- Optimize for the R language and decrease overall runtime for a particular run.
- Adjust for a team of different players (currently assumes the same player at all nine hitting spots).
- Create a nice way to visualize the results.
- Link to more recent data.
  - Through the Lahman package.
  - Through "live" data.
- Add in ability to manipulate lineup order and be able to compare pros and cons behind various strategies.
- Add in ability for lineup substitutions.

### Links:
- [Github repository](https://github.com/ct-analytics/baseball-dp)
- [Original Problem website](http://www.footballcommentary.com/bbmodel.htm)
