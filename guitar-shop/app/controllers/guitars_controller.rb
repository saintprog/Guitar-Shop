class GuitarsController < ApplicationController
  def index
    if can? :read, Guitar
      @guitars = Guitar.all
    else
      redirect_to root_url
    end
  end

  def show
    if can? :read, Guitar
      @guitar = Guitar.find(params[:id])
    else
      redirect_to root_url
    end
  end

  def edit
    if can? :update, Guitar
      @guitar = Guitar.find(params[:id])
    else
      redirect_to root_url
    end
  end

  def new
    if can? :create, Guitar
      @guitar = Guitar.new
    else
      redirect_to root_url
    end
  end

  def update
    if can? :update, Guitar
      @guitar = Guitar.find(params[:id])
      if @guitar.update_attributes(params[:guitar])
        redirect_to @guitar
      else
        render 'edit'
      end
    else
      redirect_to root_url
    end
  end

  def create
    if can? :create, Guitar
      @guitar = Guitar.new(params[:guitar])
   
      if @guitar.save
        redirect_to @guitar
      else
        render 'new'
      end
    else
      redirect_to root_url
    end
  end

  def destroy
    if can? :update, Guitar
      @guitar = Guitar.find(params[:id])
      @guitar.destroy
     
      redirect_to guitars_path
    else
      redirect_to root_url
    end
  end

end