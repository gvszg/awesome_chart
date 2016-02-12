class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.string :email, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end