---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "MLB Player Similarity - Validation"
subtitle: ""
summary: ""
authors: 
- admin
tags: 
- MLB
- Other
categories: 
- R
date: 2019-11-13T19:22:56-05:00
lastmod: 2021-01-18T19:22:56-05:00
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

As many of you are aware, Baseball-Reference calculates a similarity score for each player against other players. Although this is an accepted way to calculate the similarity between two players, I wanted to see if my methodology compares. I ran my methodology for Hank Aaron (someone we all know and can understand the comparisons) and compared the list I got against the list Baseball-Reference posted. First, let's look at what Baseball-Reference has:
1. Willie Mays (782) 
2. Barry Bonds (748) 
3. Frank Robinson (667) 
4. Stan Musial (666) 
5. Babe Ruth (645) 
6. Ken Griffey (629) 
7. Carl Yastrzemski (627) 
8. Rafael Palmeiro (611) 
9. Alex Rodriguez (610) 
10. Mel Ott (602) 

I don't think anyone would argue with any of these players. However, what's the list of players I came up with? Well, here they are:
1. Willie Mays 
2. Frank Robinson 
3. Al Kaline 
4. Ernie Banks 
5. Billy Williams 
6. Brooks Robinson 
7. Roberto Clemente 
8. Ken Boyer 
9. Norm Cash 
10. Carl Yastrzemski 

What's interesting about my list is there are certainly players that don't seem comparable to Hank Aaron. The question then becomes, how did they make it here? Quickly looking at the numbers you can see that I included more statistics for comparison than Baseball-Reference. In addition, I used a weighting scheme for comparing various statistics. 

So which one is right? I think its easy to say that Baseball-Reference seems more accurate, but I am continuously looking to improve this methodology and see how that impacts the results. Keep tuned for the final version of the code and methodology.