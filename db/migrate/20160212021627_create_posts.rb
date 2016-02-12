class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :manager_id
      t.integer :status, default: 0
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :posts, :manager_id
    add_index :posts, :deleted_at
  end
end