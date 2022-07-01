---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "SAS and Optimization"
subtitle: ""
summary: "SAS has some great tools for applying traditional constraint programming techniques."
authors: 
- admin
tags: 
- Other
categories: 
- Operations Research
- SAS
date: 2013-12-02T10:48:28-04:00
lastmod: 2021-04-22T10:48:28-04:00
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
projects: ["sas-optimization"]
---

Like most people, I would prefer to use other optimization software out there than SAS. However, it is possible to decrease friction in your analytics workflow by keeping everything inside of SAS. Typical modeling processes involve using SAS's procedures to train and score predictive models. These scores can then be used as the input into a optimization model to help with the decision process.

SAS has a great product, SAS Marketing Optimization, for doing optimization in the marketing industry. Through work in that product, I have found that it lacks flexibility to incorporate various strategies that are commonly found in campaign planning. This series of blog posts will introduce the SAS procedure OPTMODEL. This procedure allows you to define an optimization problem and the solver in which to solve it.