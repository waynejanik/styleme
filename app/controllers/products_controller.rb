class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index

    if !params[:category].blank?
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(:category_id => @category_id)
      elsif !params[:size].blank?
        @size_id = Size.find_by(name: params[:size]).id
        @products = Product.where(:size_id => @size_id)
    elsif !params[:location].blank?
      @location_id = Location.find_by(name: params[:location]).id
      @products = Product.where(:location_id => @location_id)
    else
      @products = Product.all
    end



  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = current_user.products.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
    @locations = Location.all.map{ |l| [l.name, l.id] }
    @manufacturers = Manufacturer.all.map{ |m| [m.name, m.id] }
    @sizes = Size.all.map{ |s| [s.name, s.id] }
  end

  # GET /products/1/edit
  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
    @locations = Location.all.map{ |l| [l.name, l.id] }
    @manufacturers = Manufacturer.all.map{ |m| [m.name, m.id] }
    @sizes = Size.all.map{ |s| [s.name, s.id] }
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.build(product_params)

    @product.category_id = params[:category_id]
    @product.manufacturer_id = params[:manufacturer_id]
    @product.size_id = params[:size_id]


    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @categories = Category.all.map{ |c| [c.name, c.id] }
    @manufacturers = Manufacturer.all.map{ |m| [m.name, m.id] }
    @sizes = Size.all.map{ |s| [s.name, s.id] }
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product, :price, :description, :category_id, :manufacturer_id, :size_id, :location_id, :prod_image)
    end

  def find_product
    @product = Product.find(params[:id])
  end

end
