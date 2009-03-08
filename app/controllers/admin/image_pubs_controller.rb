class Admin::ImagePubsController < Admin::BaseController
  resource_controller
  actions :destroy

  destroy.before do 
    @viewable = object.viewable
  end
  
  destroy.response do |wants| 
    wants.html do
      flash[:notice] = nil
      render :partial => '/admin/my_promotions/images', :locals => {:viewable => @viewable}
    end
  end
end
