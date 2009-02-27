class Promotions < ActiveRecord::Base
  belongs_to :product

  def self.random_subset(n)
    # randomize a small list, courtesy of
    # http://redcorundum.blogspot.com/2006/12/randomizing-array-and-other-faqs.html
    promos = n <= 0 ? [] : Promotions.find(:all).sort_by {rand}[0..n-1]
    promos.map {|p| p.product }
  end 

  def self.best_sellers(n)
    # most ordered items
    # looks for completed orders from past week, then gets top N sellers by quantity
    # query: need to filter out cancelled orders? 
    best_n = Order.checkout_completed(true).
                   between(1.week.ago,Time.now).
                   find(:all, 
                        :joins => "INNER JOIN line_items ON orders.id = line_items.order_id", 
                        :select => "variant_id, SUM (quantity) sum", 
                        :group => "variant_id ORDER BY sum DESC",
                        :limit => n)

    best_n.map {|o| [o.sum, Variant.find(o.variant_id).product] }
  end 

end
