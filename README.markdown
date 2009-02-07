Promotions
==========

Basic support for selecting a group of products to highlight

usage
-----

set promotions by calling "Promotions.create :product => some_prod" in the 
console etc (no nice admin interface yet)

call Promotions.random_subset(n) to get n products


implementation etc
------------------

at present: just a table of ids, with no uniqueness checking

please see the TODO list




