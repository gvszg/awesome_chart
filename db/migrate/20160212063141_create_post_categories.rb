class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
      t.integer :post_id, :category_id
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :post_categories, :deleted_at
    add_index :post_categories, :post_id
    add_index :post_categories, :category_id
  end
end