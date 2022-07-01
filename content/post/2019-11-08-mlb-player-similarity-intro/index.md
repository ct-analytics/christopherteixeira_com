---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Introduction to Similar Players in MLB"
subtitle: ""
summary: "An introduction to some thoughts on using data and analytics for determining player similarity in Major League Baseball."
authors: 
  - admin

tags: 
  - MLB
  - Other

categories: 
  - R

date: 2019-11-08T19:21:59-05:00
lastmod: 2021-01-18T19:21:59-05:00
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
projects: ["mlb-player-similarity"]
---

It’s a common question to compare baseball players against each other. The question is what do you actually compare? Their playing styles? Positions they played? Teams they played for? Eras they played in? There are several dimensions to which this problem’s complexity increases dramatically. In fact, several people now try to compare [Yasiel Puig](https://www.baseball-reference.com/players/p/puigya01.shtml) against [Mike Trout](https://www.baseball-reference.com/players/t/troutmi01.shtml) (like [Mark Saxon](https://www.espn.com/blog/los-angeles/dodger-report/post/_/id/5458/what-to-expect-and-not-to-expect-from-yasiel-puig)). However, how would you compare them?

I’m interested in developing an analytical technique that will remove the manual labor of looking at statistics. By removing that tedious task, it would be interesting to see how player’s careers compare against other player careers. I’m hoping that in the end, I can use this as a significant factor in being able to predict whether a player will end up in the Hall of Fame.

More to come on this topic, but here’s a little tease:

* Data sourced from Sean Lahman
* Techniques include: 
  + Dynamic Programming 
  + Social Network Analysis 
  + Logistic Regression 
* Programmed entirely in R and RStudio

The next problem is how to use all of this similarity to figure out what players are actually similar to each other. Keep an eye out for my next blog on using Social Network Analysis to cluster these players together and incorporating more than just Games Played.