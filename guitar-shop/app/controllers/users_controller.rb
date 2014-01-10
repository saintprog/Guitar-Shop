class UsersController < ApplicationController
  load_resource

  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def update
    redirect_to @user and return if @user.update_attributes(params[:user])
    render 'edit'
  end

  def create
    redirect_to @user and return if @user.save
    render 'new'
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

end