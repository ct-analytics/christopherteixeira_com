---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Optimization in SAS: Background and Data Prep"
subtitle: ""
summary: "In order to use some of the optimization proceedures, you need to process data in a certain way."
authors: 
- admin
tags: 
- Other
categories: 
- SAS
- Data Analytics
date: 2013-12-04T10:49:50-04:00
lastmod: 2021-04-22T10:49:50-04:00
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

Throughout the next few posts, I will describe various ways to tackle a typical optimization problem encountered in the marketing industry. As you might guess, a customer is available to receive multiple promotions at the same time but is only likely to give their attention to at most one promotion. Assuming that you can only send one promotion, which one is the best to send them? This is where optimization comes in combined with other marketing strategies can help determine the "best" promotion to send a customer. My sample problem will assume that you are a local financial services company that has several types of credit cards like Travel Rewards or Cash Rewards. As you might guess, there are various of options within each of the types of credit cards, like incentives and APRs that can vary per customer.

Like any analytics project, the first step is understanding your data and cleaning it up to use inside of your modeling process. For this exercise, I will be generating random data to use inside of the optimization model. I have no rhyme or reason behind the distributions I chose but decided mix it up. This model will be using four different data sources: Product Data, Pricing Data, Customer Data, Modeling Data.

The first data set describes the various products to pick from and their parameters. In this instance, we will set a volume of available offers for each product.

```sas
data product_data;
    length product $12;
    infile datalines dsd;
    input product $ @13 volume;
    datalines;
TRAVEL       500
CASH Rewards 500
HOTEL        500
;
run; 
```

The second set will define various APRs (or prices) available for each card type.

```sas
data price_data;
    input price $ volume;
    datalines;
10.99 500
;
run;
```

The third data set defines the list of customers available for a promotion and their current customer status.

```sas
data customer_data;
    call streaminit(123);
    do i = 1 to 1000;
        customer_id = compress(put(i,5.));
        customer_status = rand('BERNOULLI',.25);
        output;
    end;
    drop i;
run;
```

The last dataset will randomly assign values to represent each customer's likelihood to apply for each card product at each price point. In addition, this dataset will include the estimated profit that your bank is likely to make off each customer if they decide to apply (and get accepted) for each card. In reality, these scores are usually developed using a predictive modeling technique like linear regression or a Bayesian network.

```sas
data model_scores;
    length product $12
           price $5
    ;
    format expected_profit dollar6.2
           likelihood_to_apply 3.2
    ; 
    call streaminit(123);
    do i = 1 to 1000;
        customer_id = compress(put(i,5.));
        price = '10.99';
        product = 'TRAVEL';
            expected_profit = 100*rand('UNIFORM')+1;
            likelihood_to_apply = rand('TRIANGLE',.6);
            output;
        product = 'CASH Rewards';
            expected_profit = 100*rand('UNIFORM')+1;
            likelihood_to_apply = rand('TRIANGLE',.6);
            output;
        product = 'HOTEL';
            expected_profit = 100*rand('UNIFORM')+1;
            likelihood_to_apply = rand('TRIANGLE',.6);
            output;
    end;
    drop i;
run;
```

Now that the data is defined, the next step is to actually run a simple optimization model to pick out the best card for each customer. Keep an eye out for the next post that will get into the heart of PROC OPTMODEL and optimization.