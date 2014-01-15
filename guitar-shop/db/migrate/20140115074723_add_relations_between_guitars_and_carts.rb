class AddRelationsBetweenGuitarsAndCarts < ActiveRecord::Migration
  def up
    create_table :guitars_carts do |t|
      t.belongs_to :guitar
      t.belongs_to :cart
    end

    Cart.all.each do |cart|
      cart.guitar_ids.each do |guitar_id|
        Cart.create({:user_id => cart.user_id, :guitar_id => guitar_id})
      end
    end

  end

  def down
  end
end
