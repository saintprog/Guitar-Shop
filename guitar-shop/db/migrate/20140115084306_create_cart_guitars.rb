class CreateCartGuitars < ActiveRecord::Migration
  def up
    create_table :cart_guitars do |t|
      t.belongs_to :guitar
      t.belongs_to :cart

      t.timestamps
    end
    add_index :cart_guitars, :guitar_id
    add_index :cart_guitars, :cart_id

    Cart.all.each do |cart|
      cart[:guitar_ids].each do |guitar_id|
        CartGuitar.create!({:cart_id => cart.id, :guitar_id => guitar_id})
      end
    end

    remove_column :carts, :guitar_ids

  end

  def down
    add_column :carts, :guitar_ids, :text

    cart_hash = {}
    CartGuitar.all.each do |cart_guitar|
      if cart_hash[cart_guitar.cart_id] == nil
        cart_hash[cart_guitar.cart_id] ||= [].push cart_guitar.guitar_id
      else
        cart_hash[cart_guitar.cart_id].push cart_guitar.guitar_id
      end
    end

    cart_hash.each do |key, value|
      Cart.find(key)[:guitar_ids] = value
    end

    remove_index :cart_guitars, :cart_id
    remove_index :cart_guitars, :guitar_id
    drop_table :cart_guitars
  end
end
