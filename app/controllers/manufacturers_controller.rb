class ManufacturersController < ApplicationController
  before_action :find_manufacturer, only: [:show, :edit, :update, :destroy]


  def index
    @manufacturers = Manufacturer.all.order(:name)
  end

  def show
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to manufacturers_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @manufacturer.update(manufacturer_params)
      redirect_to manufacturer_path(@manufacturer)
    else
      render 'edit'
    end
  end

  def destroy
    @size.destroy
    redirect_to manufacturers_path
  end

  private
  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end

  def find_size
    @manufacturer = Manufacturer.find(params[:id])
  end

end
