class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def index
    if can? :read, Order
      @orders = Order.all
    else
      redirect_to root_url
    end
  end

  def show
    if can? :read, Order
    else
      redirect_to root_url
    end
  end

  def new
    if can? :create, Order
      @order = Order.new(:user_id => current_user.try(:id))
    else
      redirect_to root_url
    end
  end

  def edit
    if can? :update, Order
      @order = Order.find(params[:id])
    else
      redirect_to root_url
    end
  end

  def create
    if can? :create, Order
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
    else
      redirect_to root_url
    end
  end

  def update
    if can? :update, Order
      @order = Order.find(params[:id])
      if @order.update_attributes(params[:order])
        redirect_to User.find(@order.user_id)
      else
        render 'edit'
      end
    else
      redirect_to root_url
    end
  end

  def destroy
    if can? :destroy, Order
      @order = Order.find(params[:id])
      @guitar = Guitar.find(@order.guitar_id)
      @order.destroy
      @guitar.update_attribute('count', @guitar.count+1)
      redirect_to User.find(@order.user_id)
    else
      redirect_to root_url
    end
  end

end
