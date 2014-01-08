class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :guitar
  has_many :payments
  attr_accessible :cost, :paid, :status, :user_id, :guitar_id, :payments_attributes

  accepts_nested_attributes_for :payments, :allow_destroy => true

  before_create :decrease_guitar
  before_destroy :increase_guitar

  private
    def decrease_guitar
      @guitar = Guitar.find(self.guitar_id)
      @guitar.update_attribute('count', @guitar.count - 1)
    end

    def increase_guitar
      @guitar = Guitar.find(self.guitar_id)
      @guitar.update_attribute('count', @guitar.count + 1)
    end
end
