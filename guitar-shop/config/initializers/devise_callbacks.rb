Warden::Manager.after_authentication do |auth, opts|
  Order.where(status: "not defined").all.each do |order|
    order.update_attribute('user_id', user.id)
    order.update_attribute('status', waiting)
  end
end