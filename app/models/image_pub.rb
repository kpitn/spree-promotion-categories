class ImagePub < ActiveRecord::Base
  has_attached_file :attachment,
                    :styles => { :mini => '200x50>', :pub => '728x180>' },
                    :default_style => :product,
                    :url => "/assets/pub/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/pub/:id/:style/:basename.:extension"

  belongs_to :my_promotion
  belongs_to :product
end