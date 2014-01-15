Warden::Manager.after_authentication do |user, auth, opts|
  # Order.where(status: "not defined").all.each do |order|
  #   order.update_attribute('user_id', user.id)
  #   order.update_attribute('status', "waiting")
  # end

  Cart.where(user_id: nil).all.each do |cart|
    cart.update_attribute('user_id', user.id)
  end

  Cart.create(:user_id => user.id, :guitar_ids => [])
end