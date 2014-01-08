class GuitarsController < ApplicationController
  authorize_resource

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
    redirect_to @guitar if @guitar.update_attributes(params[:guitar])
    render 'edit' unless @guitar.update_attributes(params[:guitar])
  end

  def create
    @guitar = Guitar.new(params[:guitar])
    redirect_to @guitar if @guitar.save
    render 'new' unless @guitar.save
  end

  def destroy
    @guitar = Guitar.find(params[:id])
    @guitar.destroy
    redirect_to guitars_path
  end

end