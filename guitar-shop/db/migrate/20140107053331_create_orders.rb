class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :guitar
      t.string :status
      t.integer :cost
      t.integer :paid

      t.timestamps
    end
    add_index :orders, :user_id
    add_index :orders, :guitar_id
  end
end
