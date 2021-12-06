module ProductsHelper
  def show_json(product)
    to_json = JSON.parse product
    json_to_render = { id: to_json['_id']['$oid'],
                       sku: to_json['sku'],
                       nome: to_json['name'],
                       description: to_json['description'],
                       amount: to_json['amount'],
                       price: to_json['price']
                      }
  end

  def index_json(products)
    json_to_render = []
    products.each do |product|
      json_to_render << show_json(product.to_json)
    end
    json_to_render
  end
end
