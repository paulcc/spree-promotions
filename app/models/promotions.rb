class Promotions < ActiveRecord::Base
  belongs_to :product

  def self.random_subset(n)
    # randomize a small list, courtesy of
    # http://redcorundum.blogspot.com/2006/12/randomizing-array-and-other-faqs.html
    promos = n <= 0 ? [] : Promotions.find(:all).sort_by {rand}[0..n-1]
    promos.map {|p| p.product }
  end 

end
