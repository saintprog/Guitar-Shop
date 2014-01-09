class Admin::OrdersController < ApplicationController
  before_filter :is_admin
  before_filter :authenticate_user!, :except => :create
  authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def index
    if params[:guitar_id] == '' && params[:user_id] == ''
      @orders = Order.all
    elsif params[:user_id] == ''
      @orders = Order.where(guitar_id: params[:guitar_id]).all
    elsif params[:guitar_id] == ''
      @orders = Order.where(user_id: params[:user_id]).all
    else
      @orders = Order.where(user_id: params[:user_id], guitar_id: params[:guitar_id]).all
    end
  end

  def show
  end

  def new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params[:order])
    if Guitar.find(@order.guitar_id).count != 0
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

  private
    def is_admin
      redirect_to root_url if !current_user.admin?
    end

end
