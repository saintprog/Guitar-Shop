class AddArrayToCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :guitar_ids
    add_column :carts, :guitar_ids, :text
  end
end
