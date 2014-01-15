class CartGuitar < ActiveRecord::Base
  belongs_to :guitar
  belongs_to :cart
  attr_accessible :guitar_id, :cart_id

  before_create :decrease_guitar
  before_destroy :increase_guitar

  private
    def decrease_guitar
      @guitar = Guitar.find(self.guitar_id)
      @guitar.update_attribute('count', @guitar.count - 1)
      true
    end

    def increase_guitar
      @guitar = Guitar.find(self.guitar_id)
      @guitar.update_attribute('count', @guitar.count + 1)
      true
    end
end
