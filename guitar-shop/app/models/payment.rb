class Payment < ActiveRecord::Base
  belongs_to :order
  attr_accessible :summ
end
