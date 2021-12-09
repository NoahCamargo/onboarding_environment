defmodule ApiProductsWeb.ProductsView do
  use ApiProductsWeb, :view
  alias ApiProductsWeb.ProductsView

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductsView, "products.json")}
  end

  def render("show.json", %{products: products}) do
    %{data: render_one(products, ProductsView, "products.json")}
  end

  def render("products.json", %{products: products}) do
    %{id: products.id,
      sku: products.sku,
      name: products.name,
      description: products.description,
      amount: products.amount,
      price: products.price}
  end
end
