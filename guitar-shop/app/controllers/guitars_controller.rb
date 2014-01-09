class GuitarsController < ApplicationController
  authorize_resource
  before_filter :to_admin, :only => :index

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def index
    @guitars = Guitar.all
  end

  def show
    @guitar = Guitar.find(params[:id])
  end

  def edit
    @guitar = Guitar.find(params[:id])
  end

  def new
    @guitar = Guitar.new
  end

  def update
    @guitar = Guitar.find(params[:id])
    if @guitar.update_attributes(params[:guitar])
      redirect_to @guitar
    else
      render 'edit'
    end
  end

  def create
    @guitar = Guitar.new(params[:guitar])
    if @guitar.save
      redirect_to @guitar
    else
      render 'new'
    end
  end

  def destroy
    @guitar = Guitar.find(params[:id])
    @guitar.destroy
    redirect_to guitars_path
  end

  private
    def to_admin
      if current_user.try(:id) == nil
        return
      elsif current_user.admin?
        redirect_to admin_guitars_path
      end
    end

end