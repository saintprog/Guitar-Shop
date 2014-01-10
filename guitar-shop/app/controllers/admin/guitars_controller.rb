class Admin::GuitarsController < ApplicationController
  before_filter :is_admin
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def update
    if @guitar.update_attributes(params[:guitar])
      redirect_to [:admin, @guitar]
    else
      render 'edit'
    end
  end

  def create
    if @guitar.save
      redirect_to [:admin, @guitar]
    else
      render 'new'
    end
  end

  def destroy
    @guitar.destroy
    redirect_to admin_guitars_path
  end

  private
    def is_admin
      redirect_to root_url and return if current_user.try(:id) == nil
      redirect_to root_url if !current_user.try(:admin)
    end

end