# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PromotionsExtension < Spree::Extension
  version "1.0"
  description "select a subset of products for front-page display"
  url "http://yourwebsite.com/promotions"

  # define_routes do |map|
  #   map.namespace :admin do |admin|
  #     admin.resources :whatever
  #   end  
  # end
  
  def activate
    Product.class_eval do
      before_update :delete_promotions
      private
      def delete_promotions
        Promotions.destroy_all(:product_id => id) if deleted_at
      end
    end
  end
  
  def deactivate
    # admin.tabs.remove "Promotions"
  end
  
end
