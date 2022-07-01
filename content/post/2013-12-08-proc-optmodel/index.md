---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Optimization in SAS: Proc OPTMODEL"
subtitle: ""
summary: "With data, let's formulate our optimization model and get the code ready to execute."
authors: 
- admin
tags: 
- Other
categories: 
- SAS
- Operations Research
date: 2013-12-08T10:50:10-04:00
lastmod: 2021-04-22T10:50:10-04:00
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

Now that the data has been prepped, it's time to build the optimization model. Let's take a step back an formulate the problem first. Every constraint based optimization problem is divided into three parts: the objective function, the decision variables, and the constraints. 

Remember that the problem is to identify the best promotion available for each person. The decision variable is binary, whether a person will receive a specific promotion or not. In this example, a specific promotion is identified by a combination of credit card type and APR.

The objective we will maximize over will be our idea of profit. Profit will be made up of two pieces of information that are typically modeled:

- Expected profit is defined as the profit (over a period of time) that can be earned from the customer if they open up a specific credit card. 
- Likelihood that a customer will apply for a particular credit card if they receive a promotion from us.

The resulting objective function becomes the sum of all expected profit against the likelihood they apply for that account, if we choose to mail them a promotion for that account.

For this first example, we will keep our list of constraints short and simple. Here's the list of constraints we will implement in this first iteration:

1. Limit the number of promotions that each customer can receive per campaign.
2. Each credit card that is mailed to a customer needs to have only one price.
3. Limit the number of total promotions mailed per card type and price point. 

Now that we have the formulation out of the way, let's code! I will walk you through my recommendations behind using OPTMODEL. I've found this style is the easiest to explain to colleagues and follow. 

The first step in using OPTMODEL is to define the list of "iterators" for which the optimization model will use. An iterator is a list of items that can be used to iterate through when defining constraints or reading in data. Although not necessary, it certainly helps keep your code short and easy to review. For this problem, we will define three iterators:

1. Customers: the list of customers to analyze inside of this campaign
2. Products: the list of credit card types to be promoted
3. Prices: the list of various price points for each of the credit card types

```sas
proc optmodel;
    set <str> customers;
    set <str> products;
    set <str> prices;
```

The next step will be defining all of the data that will be used inside of the optimization model. Here are the variables we will reading in:

1. Expected_profit: defined as the expected profit earned on a credit card at that price for a particular customer
2. Likelihood_to_apply: defined as the likelihood that a customer will apply for a particular credit card at a that price
3. Product_volume: defined as the number of promotions that can be sent for each credit card
4. Price_volume: defined as the number of promotions that can be sent for each price 
5. NUM_PRODUCTS_PER_CUSTOMER: a constant that defines the number of credit card promotions that can be sent to a person.

```sas
    number expected_profit {customers, products, prices};
    number likelihood_to_apply {customers, products, prices};
    number product_volume {products};
    number price_volume {prices};

    number NUM_PRODUCTS_PER_CUSTOMER = 1;
```

The next step is to populate those variables with actual data. Given the data we produced back my [last post](), we will use the "read data" phrase to get data into our optimization model. Since we have four datasets, we will use four different "read data" phrases. A "read data" phrase can be constructed as follows:

```sas
    read data datasetname into iterator=[columnname] product_volume=col("columnname");
```

We will start with the product_data dataset. Since this dataset is unique at the product level, we can use it to set values for the products iterator we defined above. Note that the only variable that is defined at the product level is product_volume.

```sas
    read data product_data into products=[product] product_volume=col("volume");
```

The next dataset is read in will be data related to the prices. Note that the only variable that is defined at the price level is price_volume.

```sas
    read data price_data into prices=[price] price_volume=col("volume");
```

Note we don't have any customer data used in the model, but we will still need a way to identify each customer. 

```sas
    read data customer_data into customers=[customer_id];
```

Last but not least, we need to read in the two model scores. Since this dataset is unique at the combination of customer, product and price we put all three indices in the brackets. Note that since all three iterators were defined, we don't need to list which one is mapped to which but order the variables as they were defined.

```sas
    read data model_scores into [customer_id product price] likelihood_to_apply expected_profit;
```

As with any model, I like to verify that the data is correct and read in properly. The following print statement will print out the two variables for the first customer (with ID='1').

```sas
    print {c in customers,p in products,q in prices: c='1'} likelihood_to_apply
          {c in customers,p in products,q in prices: c='1'} expected_profit
    ;
```

Now that the data has been read it, let's define the model. First up, our decision variable. Note we need to make a decision on whether to mail each person which product at what price. 

```sas
    var mail {customers, products, prices} binary;
```

Next is to define the objective function, profit. I will define profit as the sum of expected profit times to likelihood to apply times whether they get a promotion for all customers, credit cards, and prices.

```sas
    max profit = sum{c in customers, p in products, q in prices} 
        likelihood_to_apply[c,p,q]*expected_profit[c,p,q]*mail[c,p,q];
```

Next I will define each of the constraints mentioned above. The first constraint limits the number of promotions a customer can receive. The second one limits the number of pricing points per credit card. The third and fourth constraints limit the number of promotions that can be mailed per credit card and price respectively.

```sas
    constraint PRODUCT_PER_CUST{c in customers}:
        sum{p in products, q in prices} mail[c,p,q] <= NUM_PRODUCTS_PER_CUSTOMER;

    constraint PRICE_PER_PROD{c in customers,p in products}:
        sum{q in prices} mail[c,p,q] <= 1;

    constraint CONS_price_volume{q in prices}:
        sum{c in customers,p in products} mail[c,p,q] <= price_volume[q];

    constraint CONS_product_volume{p in products}:
        sum{c in customers,q in prices} mail[c,p,q] <= product_volume[p];
```

Now the easy part, solve the problem. There are multiple options involved with the solver inside of SAS but I will start out simply and identify the solver for Integer Programming problems.

```sas
    solve with milp;
```

Given the nature of solvers, I will clean up the solution to eliminate any potential rounding errors.

```sas
    for {c in customers, p in products, q in prices} mail[c,p,q] = round(mail[c,p,q],1E-4);
```

I will also create a dataset with the results of the optimization problem. This "create data" statement will create a dataset with three ID columns: customer_id, product, and price. I will then append in three data columns: lta, e_profit and mail.

```sas
    create data results from
        [customer_id product price] = {c in customers, p in products, q in prices}
        lta = likelihood_to_apply[c,p,q]
        e_profit = expected_profit[c,p,q]
        mail = mail[c,p,q]
    ;
quit;
```

Well that was pretty long, but it will provide as the basis for future enhancements and explorations into the problem. You can find the full listing of code below. My next post will explore the log and the results of this program.

{{< gist ct-analytics 2476149aaab59c1e2d0703df52af8351 >}}
