class Guitar < ActiveRecord::Base
  has_one :order
  has_many :cart_guitars
  has_many :carts, :through => :cart_guitars
  
  attr_accessible :brand, :cost, :count, :model
end
