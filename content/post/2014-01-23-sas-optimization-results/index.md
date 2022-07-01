---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Optimization in SAS: Results"
subtitle: ""
summary: "It's time to execute the model and examine the results from proc optmodel."
authors: 
- admin
tags: 
- Other
categories: 
- SAS
- Operations Research
- Data Vizualization
date: 2014-01-23T10:50:42-04:00
lastmod: 2021-04-22T10:50:42-04:00
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

After spending all the time writing up code, next comes the fun part and what we really get paid for in the consulting world. I'm going to walk through three pieces of the results having hit "run". The three pieces are:
1. The Log: This contains information behind the compilation of the code, including errors and high level results.
2. The Results Window (Tab if you are in SAS EG): Contains the default results of having written a basic PROC OPTMODEL.
3. Graphing the results: Some bonus code at the end to make some sense

First up, the log produced from the program. SAS uses the log in order to print out the model description and the high level results. I'll skip the boring parts of the log where it reprints the code and get right to the important part. This set of "notes" in SAS describes what was created as the optimization formulation. It will also give the stats around "presolving" the problem and the solution status. SAS "presolves" the optimization problem by removing extraneous information like variables and non-binding constraints.

```sas
NOTE: The problem has 3000 variables (0 free, 0 fixed).
NOTE: The problem has 3000 binary and 0 integer variables.
NOTE: The problem has 4004 linear constraints (4004 LE, 0 EQ, 0 GE, 0 range).
NOTE: The problem has 12000 linear constraint coefficients.
NOTE: The problem has 0 nonlinear constraints (0 LE, 0 EQ, 0 GE, 0 range).
NOTE: The OPTMODEL presolver removed 0 variables, 3003 linear constraints, and 0 nonlinear constraints.
NOTE: The OPTMODEL presolved problem has 3000 variables, 1001 linear constraints, and 0 nonlinear constraints.
NOTE: The OPTMODEL presolver removed 8000 linear constraint coefficients, leaving 4000.
NOTE: The OPTMILP presolver value AUTOMATIC is applied.
NOTE: The OPTMILP presolver removed 0 variables and 0 constraints.
NOTE: The OPTMILP presolver removed 0 constraint coefficients.
NOTE: The OPTMILP presolver modified 0 constraint coefficients.
NOTE: The presolved problem has 3000 variables, 1001 constraints, and 4000 constraint coefficients.
NOTE: The MIXED INTEGER LINEAR solver is called.
          Node  Active    Sols    BestInteger      BestBound      Gap    Time
             0       1       2  41528.0754238  41528.0754238    0.00%       1
             0       0       2  41528.0754238              .    0.00%       1
NOTE: Optimal.
NOTE: Objective = 41528.0754.
```

Hooray, the model not only solved, but it found an optimal solution. Next part is to check the results of the program. This is where SAS will put all printouts from the procedures used in the program. There are three sections to this problem in the results section. The first one is the test print we had to verify that our data was read in to the model correctly.

{{< figure src="sas optimization test print.png" >}}

The next part shows the model summary. You'll noticed that this looks like the output in the log, but forced into a table format. I don't particularly use this table very often other than to verify the size of the table. It can be helpful to note the size of the table in reference to the run-time for the problem.

{{< figure src="sas optimization problem summary.png" >}}

The last piece shows the solution summary. This gives you some of the relevant information you need to evaluate your model.

{{< figure src="sas optimization solution summary.png" >}}

The last step for me is taking a stab at visualizing the results produced by the optimization model. Since this optimization problem is relatively simple, I want to color code who was mailed and who wasn't for each of the products. Since my objective function is the product of Profit and the Likelihood To Apply, I use each as an axis inside of the chart. Below is the simple macro I use to build the chart for each product. First I use SQL to generate a dynamic header for the chart with the total expected profit for that product. I then use SGPLOT to draw the scatter plot. 

```sas
proc format;
    value mail
        1="Mail"
        0="No Mail"
    ;
run;

%macro graph_results(product);
goptions device=svg;
ods graphics on / antialiasmax=10000;
proc sql noprint;
    select sum(e_profit*lta) format=dollar12. 
        into :profit 
        from results 
        where mail=1
        and product = "&product"
    ;
quit;

proc sgplot data=results;
    title1 "Optimization Results for &product.";
    title2 "Total Expected Profit = &profit.";
    where product = "&product";
    format mail mail.;
    scatter x=e_profit y=lta / 
        group=mail 
        markerattrs=(size=5 symbol=circlefilled)
        transparency=0.7
        name="scatter"
    ;
    keylegend "scatter" / across=1 position=topleft noborder location=inside ;
    xaxis label="Expected Profit" values=(0 to 100 by 20) display=(noticks);
    yaxis label="Likelihood to Apply" values=(0 to 1 by .1) display=(noticks);
run;
title;
ods graphics off;
goptions reset=all;
%mend;

%graph_results(TRAVEL);
```

{{< figure src="sas optimization results visualization.png" >}}

Note that it isn't the greatest picture, but it gives you an idea of the solution. I hope to give the same visualization a shot in Tableau to demonstrate that without coding up a chart, you can still get a nice visualization.
