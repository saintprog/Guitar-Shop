class Cart < ActiveRecord::Base
  serialize :guitar_ids, Array 
  belongs_to :user
  attr_accessible :guitar_ids, :user_id
end
