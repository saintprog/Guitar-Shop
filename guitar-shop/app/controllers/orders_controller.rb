class OrdersController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource

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
    if Guitar.find(params[:guitar_id]).count !=0
      @order = Order.new(:user_id => params[:user_id], 
                         :guitar_id => params[:guitar_id],
                         :cost => params[:cost],
                         :status => params[:status])

      if @order.save
        @guitar = Guitar.find(@order.guitar_id)
        @guitar.update_attribute('count', @guitar.count-1)
        redirect_to guitars_path
      else
        render 'new'
      end
    else
      
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
    @guitar = Guitar.find(@order.guitar_id)
    @order.destroy
    @guitar.update_attribute('count', @guitar.count+1)
    redirect_to User.find(@order.user_id)
  end

end
