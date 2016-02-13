class AddCreatedOnToTables < ActiveRecord::Migration
  def change
    add_column :categories, :created_on, :datetime
    add_column :comments, :created_on, :datetime
    add_column :post_categories, :created_on, :datetime
    add_column :posts, :created_on, :datetime
    add_column :subscribes, :created_on, :datetime
  end
end