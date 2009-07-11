# Promotions

Basic support for selecting a group of products to highlight

## usage

set promotions by calling "Promotions.create :product => some_prod" in the 
console etc (no nice admin interface yet)

call Promotions.random_subset(n) to get n products

call Promotions.best_sellers(n, start = 1.week.ago, finish = Time.now) to get 
the n best sellers in the selected time period (default: the past week)




## implementation etc

at present: just a table of ids, with no uniqueness checking



## TODO list 

  0. admin interface
     flag on each product? or drop-down list?

  2. filter this by taxons??

  3. maybe extend to "also bought"?


