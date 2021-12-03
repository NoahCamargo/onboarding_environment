module RegistersHelper
    def jsonConfig(registers)
        return registers.map{|register| {:sku => register.sku, :name =>  register.name,:description => register.description,:price => register.price, :qtd=>register.qtd} }
    end
end
