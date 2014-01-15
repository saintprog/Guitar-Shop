class Cart < ActiveRecord::Base
  serialize :guitar_ids, Array 
  belongs_to :user
  has_one :order
  has_many :cart_guitars
  has_many :guitars, :through => :cart_guitars
  attr_accessible :guitar_ids, :user_id
end
