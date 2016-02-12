class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title, :content, :key
      t.integer :status, default: 0
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :comments, :deleted_at
    
    add_column :posts, :key, :string
    add_column :categories, :key, :string
  end
end