
proc optmodel;
    set <str> customers;
    set <str> products;
    set <str> prices;

    number expected_profit {customers, products, prices};
    number likelihood_to_apply {customers, products, prices};
    number product_volume {products};
    number price_volume {prices};

    number NUM_PRODUCTS_PER_CUSTOMER = 1;

    read data product_data into products=[product] product_volume=col("volume");
    read data price_data into prices=[price] price_volume=col("volume");
    read data customer_data into customers=[customer_id];
    read data model_scores into [customer_id product price] likelihood_to_apply expected_profit;

    print {c in customers,p in products,q in prices: c='1'} likelihood_to_apply
          {c in customers,p in products,q in prices: c='1'} expected_profit;

    var mail {customers, products, prices} binary;

    max profit = sum{c in customers, p in products, q in prices} 
        likelihood_to_apply[c,p,q]*expected_profit[c,p,q]*mail[c,p,q];

    constraint PRODUCT_PER_CUST{c in customers}:
        sum{p in products, q in prices} mail[c,p,q] <= NUM_PRODUCTS_PER_CUSTOMER;

    constraint PRICE_PER_PROD{c in customers,p in products}:
        sum{q in prices} mail[c,p,q] <= 1;

    constraint CONS_price_volume{q in prices}:
        sum{c in customers,p in products} mail[c,p,q] <= price_volume[q];

    constraint CONS_product_volume{p in products}:
        sum{c in customers,q in prices} mail[c,p,q] <= product_volume[p];

    solve with milp / ;

    for {c in customers, p in products, q in prices} mail[c,p,q] = round(mail[c,p,q],1E-4);

    create data results from
        [customer_id product price] = {c in customers, p in products, q in prices}
        lta = likelihood_to_apply[c,p,q]
        e_profit = expected_profit[c,p,q]
        mail = mail[c,p,q]
    ;
quit;
