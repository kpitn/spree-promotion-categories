class PromotionCategory < ActiveRecord::Base
    #validates_presence_of :name
  belongs_to :my_promotion
  belongs_to :taxon

end