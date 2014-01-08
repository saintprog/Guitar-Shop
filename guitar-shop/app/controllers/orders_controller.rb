class OrdersController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new(:user_id => current_user.try(:id))
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params[:order])
    if Guitar.find(@order.guitar_id).count !=0
      if @order.save
        redirect_to guitars_path
      else
        render 'new'
      end
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      redirect_to User.find(@order.user_id)
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to User.find(@order.user_id)
  end

end
