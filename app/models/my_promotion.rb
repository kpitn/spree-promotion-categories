class MyPromotion < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :promotion_categories
  has_many :image_pubs, :as => :viewable, :order => :position, :dependent => :destroy

  #has_and_belongs_to_many :promotion_categories, :class_name => "MyPromotion", :join_table => "promotion_categories" , :association_foreign_key => "my_promotion_id"
end