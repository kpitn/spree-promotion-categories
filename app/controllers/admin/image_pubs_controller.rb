class Admin::ImagePubsController < Admin::BaseController
  resource_controller
  layout false
  actions :destroy
  before_filter :set_my_promotion, :only=>[:destroy,:available_product,:search,:select_product]


  destroy.before do 
    @viewable =@my_promotion
  end
  
  destroy.response do |wants| 
    wants.html do
      flash[:notice] = nil
      render :partial => '/admin/my_promotions/images', :locals => {:viewable => @viewable}
    end
  end

    def search

    end

    def select_product

      product=Product.find(params[:product_id])
      respond_to do |format|
        if product
          @image_pub.product_id=product.id
          if @image_pub.save
          format.js {
              render :update do |page|
                      page << "(function($) {$('#image_pub_#{@image_pub.id} .name').html('#{escape_javascript product.name}');$('#dialog').jqmHide();})(jQuery)"
              end
              }
          else
          format.js {
              render :update do |page|
                      page << "alert('problem');"
              end
              }
          end
        else
          format.js {
              render :update do |page|
                      page << "alert('product not found);"
              end
              }
        end
      end
    end

  def available_product
    if params[:q].blank?
      @available_products = []
    else
      @available_products = Product.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
    end
    #@available_products.delete_if { |taxon| @product.taxons.include?(taxon) }
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end
  end

  private
    def set_my_promotion
      @my_promotion=MyPromotion.find(params[:my_promotion_id])
      @image_pub=ImagePub.find(params[:id])
    end
end
