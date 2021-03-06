class OrdersController < ApplicationController
  before_filter :authenticate_user!, :except => :create
  after_filter :create_order, :only => :create
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if user_signed_in?
      @summ = 0
      Cart.find(params[:cart_id]).guitar_ids.each do |guitar_id|
        @summ += Guitar.find(guitar_id).cost
      end
      @order = Order.new({:user_id => current_user.id, 
                          :cart_id => params[:cart_id], 
                          :cost => @summ,
                          :status => "waiting"})
      redirect_to root_url if @order.save
    else
      if Guitar.find(@order.guitar_id).count != 0
        redirect_to guitars_path and return if @order.save
        render 'new'
      end
    end
  end

  def update
    redirect_to User.find(@order.user_id) and return if @order.update_attributes(params[:order])
    render 'edit'
  end

  def destroy
    @order.destroy
    redirect_to User.find(@order.user_id)
  end

  private
    def create_order
      authenticate_user!
    end

end
