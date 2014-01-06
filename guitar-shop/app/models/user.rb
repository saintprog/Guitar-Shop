class User < ActiveRecord::Base
  attr_accessible :birthday, :name, :surname
end
