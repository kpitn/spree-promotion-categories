class ImagePub < Asset
  has_attached_file :attachment,
                    :styles => { :mini => '200x50>', :pub => '728x180>' },
                    :default_style => :product,
                    :url => "/assets/pub/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/pub/:id/:style/:basename.:extension"
end