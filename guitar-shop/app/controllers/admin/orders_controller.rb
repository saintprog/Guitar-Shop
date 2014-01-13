class Admin::OrdersController < ApplicationController
  before_filter :is_admin
  before_filter :authenticate_user!, :except => :create
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def index
    @orders = Order.where(user_id: params[:user_id], guitar_id: params[:guitar_id]).all
    @orders = Order.where(user_id: params[:user_id]).all if params[:guitar_id] == ''
    @orders = Order.where(guitar_id: params[:guitar_id]).all if params[:user_id] == ''
    @orders = Order.all if params[:guitar_id] == '' && params[:user_id] == ''
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    # if Guitar.find(@order.guitar_id).count != 0
    #   redirect_to guitars_path and return if @order.save
    #   render 'new'
    # end

    params[:guitar_ids].each do |gid|
      @order = Order.new({:user_id => current_user.id, :guitar_id => gid, :cost => Guitar.find(gid).cost, :status => "waiting"})
      @order.save
      Cart.where(:user_id == current_user.try(:id)).last.guitar_ids.delete("#{gid}")
    end
    redirect_to cart_path(Cart.where(:user_id == current_user.try(:id)).last, :update => "ordered"), method: :put
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
    def is_admin
      redirect_to root_url and return if current_user.try(:id) == nil
      redirect_to root_url if !current_user.admin?
    end

end
