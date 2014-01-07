class Guitar < ActiveRecord::Base
  has_one :order
  
  attr_accessible :brand, :cost, :count, :model
end
