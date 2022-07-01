---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "MLB Player Similarity - Calculation"
subtitle: ""
summary: "An initial look into how to calculate the similarity between two players in Major League Baseball."
authors: 
- admin

tags: 
- MLB
- Other

categories: 
- R
- SAS
- Operations Research

date: 2019-11-10T19:22:34-05:00
lastmod: 2021-01-18T19:22:34-05:00
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

As I mentioned in [Similar Players in MLB]({{< relref "/post/2019-11-08-mlb-player-similarity-intro" >}}), I want to be able to see how similar players can be. I decided to take a somewhat different approach by looking at how a player's career compares against another player's career. In order to put things in terms of a career, I didn't want to simply sum up their statistics or normalize given the number of years they played. I wanted to be able to compare a player's second year against another player's second year. This isn't a simple problem though.

First part of the problem, what statistics do you use to compare two different players? Using the [Lahman Database](http://www.seanlahman.com/baseball-archive/statistics/), I had easy access to the common statistics like games played, at bats, runs scored, hits, doubles, triples, etc. However, this database doesn't simply just have the counting stats by year. It is a compiled record of stats by league and team. In order to simplify the data collection, I aggregated the information up to the combination of player and year.

Second part of the problem, how accurate is it to compare a player's first year against another player's first year? Is it possible to correct for a player being sent to the majors a little early or taking a couple years to develop? This means being able to compare a player's first year against another player's first, second, or perhaps third year to determine the closest match. How do you adjust for a player's third year against a player's first year? While I use SAS at work, I don't have access to it's functions at home. I noticed that SAS's [PROC SIMILARITY](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/etsug/etsug_similarity_toc.htm) has the capability for being able to calculate the minimum distance between two time series. Consider the example below of two player's games.

{{< figure src="example player games.png" >}}

Note that they're not the exact same, but you can see the similarity between the two. Using dynamic programming, you can find the minimum distance between these two time series. Distance between two time series can be a simple euclidean distance or something slightly different. However, I don't have access to SAS at home. Luckily enough, I was able to find a package in R that has this capability. Using the ["dtw" package](https://cran.rstudio.com/web/packages/dtw/), you can easily calculate the distance between two different time series. Applying this package to the above example, gives you the results below. This three-way plot shows each player's data in the margins and how each point maps. The closer the plot is to Y=X implies the how close the mapping of one series of data is to another.

{{< figure src="example players games results.png" >}}

The next problem is how to use all of this similarity to figure out what players are actually similar to each other. Keep an eye out for my next blog on using Social Network Analysis to cluster these players together and incorporating more than just Games Played.