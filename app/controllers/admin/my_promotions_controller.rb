class Admin::MyPromotionsController < Admin::BaseController
  resource_controller
  after_filter :set_image, :only => [:create, :available, :update]

  
  create.wants.html  {redirect_to edit_admin_my_promotion_url(@my_promotion) }
  update.wants.html {redirect_to edit_admin_my_promotion_url(params[:id])}

  def preview
    @my_promotion = MyPromotion.find(params[:id])
  end
  

  private
  def set_image
      return unless params[:image]
      return if params[:image][:attachment].blank?
      image = ImagePub.create params[:image] if params[:image]
      object.image_pubs << image
    end
end
