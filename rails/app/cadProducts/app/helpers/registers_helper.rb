# frozen_string_literal: true

# This helper is responsible for controller registers
module RegistersHelper
  def json_config(registers)
    registers.map do |register|
      { sku: register.sku,
        name: register.name,
        description: register.description,
        price: register.price,
        qtd: register.qtd }
    end
  end

  def json_config_create(register)
    { sku: register.sku,
      name: register.name,
      description: register.description,
      price: register.price,
      qtd: register.qtd }
  end
end
