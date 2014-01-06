class CreateGuitars < ActiveRecord::Migration
  def change
    create_table :guitars do |t|
      t.string :brand
      t.string :model
      t.integer :cost
      t.integer :count

      t.timestamps
    end
  end
end
