module ProductsHelper
  def show_json(product)
    json_to_render = { id: product['_id'].to_s,
                       sku: product['sku'],
                       nome: product['name'],
                       description: product['description'],
                       amount: product['amount'],
                       price: product['price'] }
  end

  def index_json(products)
    products.map { |product| show_json(product) }
  end
end
