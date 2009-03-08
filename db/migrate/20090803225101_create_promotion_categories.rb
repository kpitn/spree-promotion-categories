class CreatePromotionCategories < ActiveRecord::Migration
  def self.up
    create_table :my_promotions, :force => true do |t|
      t.string :name, :limit=>50
      t.string :pub_file_name
      t.string :pub_content_type
      t.integer:pub_file_size
      t.datetime :pub_updated_at
      t.datetime :start_date
      t.datetime :end_date
	    t.timestamps
	  end
    
    create_table :promotion_categories, :force => true do |t|
      t.integer :taxon_id
      t.integer :my_promotion_id
      t.datetime :created_at
    end
    add_index(:promotion_categories, :taxon_id)
    add_index(:promotion_categories, :my_promotion_id)
  end

  def self.down
    drop_table :my_promotions
    drop_table :promotion_categories
  end
end

