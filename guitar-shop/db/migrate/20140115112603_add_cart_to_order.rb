class AddCartToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :cart_id, :belongs_to
  	add_index :orders, :cart_id
  end
end
