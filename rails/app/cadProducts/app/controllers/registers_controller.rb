# frozen_string_literal: true

# This controller is responsible for products
class RegistersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_register, only: %i[show edit update destroy]
  def index
    @registers = Register.all
    render json: view_context.json_config(@registers)
  end

  def show
    @register = Register.where(sku: params[:id])
    @register_ctrl = view_context.json_config(@register)

    if @register_ctrl.nil? || @register_ctrl == []
      render json: { error: '404  - Not found', status: 400 }
    else
      render json: @register_ctrl[0]
    end
  end

  def create
    @register = Register.new(register_params)
    if @register.save
      render json: view_context.json_config_create(@register)
    else
      render json: { error: 'Fail to create register', status: 400 }
    end
  end

  def update
    if @register.update(register_params)
      render json: { success: 'product was successfully updated' }
    else
      render json: { error: 'product was impossible to be updated', status: 400 }
    end
  end

  def destroy
    if @register.destroy
      render json: { success: 'product was successfully destroyed' }
    else
      render json: { error: 'product was impossible to be destroyed', status: 400 }
    end
  end

  private

  def set_register
    @register = Register.where(sku: params[:id])
  end

  def register_params
    params.require(:register).permit(:sku, :name, :qtd, :description, :price)
  end
end
