class RegistersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_register, only: [:show, :edit, :update, :destroy]

  def index
    @registers = Register.all
    render json: view_context.jsonConfig(@registers)
  end

  def show
    @register = Register.where(sku: params[:sku])
    render json: view_context.jsonConfig(@register)
  end

  def create
    @register = Register.new(register_params)

    if @register.save
      redirect_to action: "index"
    else
      render json: {error:"Fail to create register"} 
    end
  end
 
  def update
    if @register.update(register_params)
      render json: {success:"product was successfully updated"}
    else
      render json: {error:"product was impossible to be updated"}
    end
  end

  def destroy
    if @register.destroy
      render json: {success:"product was successfully destroyed"}
    else
      render json: {error:"product was impossible to be destroyed"}
    end
  end

  private

    def set_register
      @register = Register.where(sku: params[:sku])
    end

    def register_params
      params.require(:register).permit(:sku, :name, :qtd, :description, :price)
    end
end
