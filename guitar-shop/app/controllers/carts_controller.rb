class CartsController < ApplicationController
  load_and_authorize_resource

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
    @cart = Cart.where(:user_id == current_user.try(:id)).last
    if params[:update] == "add"
      CartGuitar.create(:cart_id => params[:cart_id], :guitar_id => params[:guitar_id])
      redirect_to root_url if @cart.save
    elsif params[:update] == "ordered"
      @cart.guitar_ids.clear
      redirect_to root_url if @cart.save
    end
  end

  def destroy
    redirect_to root_url and return if @cart.save
  end
end
