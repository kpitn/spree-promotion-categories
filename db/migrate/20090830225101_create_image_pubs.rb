class CreateImagePubs < ActiveRecord::Migration
  def self.up
    create_table :image_pubs, :force => true do |t|
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer:attachment_file_size
      t.integer:position,:limit=>4
      t.datetime :attachment_updated_at
      t.references :product
      t.references :my_promotion
	    t.timestamps
	  end
    add_index :image_pubs,:product_id
    add_index :image_pubs,:my_promotion_id

    remove_column  :my_promotions,:pub_file_name
    remove_column  :my_promotions,:pub_content_type
    remove_column  :my_promotions,:pub_file_size
    remove_column  :my_promotions,:pub_updated_at
  end

  def self.down
    drop_table :image_pubs

    add_column :my_promotions,:pub_file_name,:string
    add_column :my_promotions,:pub_content_type, :string
    add_column :my_promotions,:pub_file_size,:integer
    add_column :my_promotions, :pub_updated_at,:date
  end
end

