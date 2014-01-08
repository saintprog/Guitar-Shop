class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :order
      t.integer :summ

      t.timestamps
    end
    add_index :payments, :order_id
  end
end
