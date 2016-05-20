class SizesController < ApplicationController
  before_action :find_size, only: [:show, :edit, :update, :destroy]


  def index
    @sizes = Size.all.order(:name)
  end

  def show
  end

  def new
    @size = Size.new
  end

  def create
    @size = Size.new(size_params)
    if @size.save
      redirect_to sizes_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @size.update(size_params)
      redirect_to size_path(@size)
    else
      render 'edit'
    end
  end

  def destroy
    @size.destroy
    redirect_to sizes_path
  end

  private
  def size_params
    params.require(:size).permit(:name)
  end

  def find_size
    @size = Size.find(params[:id])
  end

end
