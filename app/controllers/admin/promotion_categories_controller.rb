class Admin::PromotionCategoriesController < Admin::BaseController
  resource_controller
  before_filter :load_object, :only => [:selected, :available, :remove]

  def selected
    @my_promotion = MyPromotion.find(params[:my_promotion_id])
    @promotion_categories = @my_promotion.promotion_categories
  end

  def available
    @my_promotion = MyPromotion.find(params[:my_promotion_id])
    if params[:q].blank?
      @available_promotion_categories = []
    else
      @available_promotion_categories = Taxon.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
    end
    @available_promotion_categories.delete_if {|taxon| @my_promotion.promotion_categories.detect { |i| i.taxon_id==taxon.id } }
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end

  end


  def remove
    PromotionCategory.delete(params[:id])
    @my_promotion = MyPromotion.find(params[:my_promotion_id])
    @promotion_categories = @my_promotion.promotion_categories
    render :layout => false
  end

  
  def select
    @my_promotion = MyPromotion.find(params[:my_promotion_id])
    taxon = Taxon.find(params[:id])
    PromotionCategory.create({:taxon_id=>taxon.id,:my_promotion_id=>@my_promotion.id})
    @promotion_categories = @my_promotion.promotion_categories
    render :layout => false
  end

end

