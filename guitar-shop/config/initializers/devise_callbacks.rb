Warden::Manager.after_authentication do |user, auth, opts|
  # Order.where(status: "not defined").all.each do |order|
  #   order.update_attribute('user_id', user.id)
  #   order.update_attribute('status', "waiting")
  # end

  session[:user_id] = user.id
  session[:cart] = Cart.where(user_id: user.id).last

  Cart.where(user_id: nil).all.each do |cart|
    cart.update_attribute('user_id', user.id)
  end

  Cart.create(:user_id => user.id)
end