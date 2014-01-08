class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :guitar
  has_many :payments
  attr_accessible :cost, :paid, :status, :user_id, :guitar_id, :payments_attributes

  accepts_nested_attributes_for :payments, :allow_destroy => true
end
