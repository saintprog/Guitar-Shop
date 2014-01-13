class CartsController < ApplicationController
  load_resource

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    redirect_to root_url and return if @cart.save
  end

  def update
    @cart = Cart.where(:user_id == current_user.id).last
    if params[:update] == "add"
      @cart.guitar_ids.push params[:guitar_id]
      redirect_to root_url and return if @cart.save
    elsif params[:update] == "ordered"
      @cart.guitar_ids.clear
      redirect_to root_url and return if @cart.save
    end
  end

  def destroy
    redirect_to root_url and return if @cart.save
  end
end
