class ProductsController < ApplicationController
  before_action :set_product, except: %i[create index]
  skip_before_filter :verify_authenticity_token

  def index
    render json: view_context.index_json(Product.all)
  end

  def show
    render json: view_context.show_json(@product.to_json)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: view_context.show_json(@product.to_json)
    else
      render json: { 'menssage' => @product.errors }
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.json { render json: { 'menssage' => 'Update performed successfully' } }
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.json { render json: { 'message' => 'Removal successful' } }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:sku, :name, :description, :amount, :price)
  end
end
