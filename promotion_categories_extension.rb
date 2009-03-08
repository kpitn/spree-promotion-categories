# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PromotionCategoriesExtension < Spree::Extension
  version "1.0"
  description "PromotionCategoriesExtension"
  url "http://yourwebsite.com/"


  define_routes do |map|

    map.namespace :admin do |admin|
      admin.resources :image_pubs
      admin.resources :my_promotions, :member => {:preview=> :get }  do |promotion|
       promotion.resources :promotion_categories, :member => {:select => :post, :remove => :post}, :collection => {:available => :post, :selected => :get}
     end
    end
  end
  
  def activate
     Admin::ConfigurationsController.class_eval do
      before_filter :add_promotion_categories_links, :only => :index

      def add_promotion_categories_links
        @extension_links << {:link => admin_my_promotions_path, :link_text => t('my_promotions'), :description => t('my_promotions_description')}
      end
    end

  end
end