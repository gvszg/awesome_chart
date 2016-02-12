class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :status, default: 0
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :categories, :deleted_at
  end
end