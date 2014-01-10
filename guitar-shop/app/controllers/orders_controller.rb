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
    if Guitar.find(@order.guitar_id).count != 0
      if @order.save
        redirect_to guitars_path
      else
        render 'new'
      end
    end
  end

  def update
    if @order.update_attributes(params[:order])
      redirect_to User.find(@order.user_id)
    else
      render 'edit'
    end
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
