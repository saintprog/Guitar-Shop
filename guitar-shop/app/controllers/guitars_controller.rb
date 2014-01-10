class GuitarsController < ApplicationController
  load_and_authorize_resource
  before_filter :to_admin, :only => :index

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def index
  end

  def show
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