defmodule ApiProductsWeb.ProductsController do
  use ApiProductsWeb, :controller

  alias ApiProducts.Management
  alias ApiProducts.Management.Products

  action_fallback ApiProductsWeb.FallbackController

  def index(conn, _params) do
    products = Management.list_myapp_development()
    render(conn, "index.json", products: products)
  end

  def create(conn, %{"products" => products_params}) do
    with {:ok, %Products{} = products} <- Management.create_products(products_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.products_path(conn, :show, products))
      |> render("show.json", products: products)
    end
  end

  def show(conn, %{"id" => id}) do
    products = Management.get_products!(id)
    render(conn, "show.json", products: products)
  end

  def update(conn, %{"id" => id, "products" => products_params}) do
    products = Management.get_products!(id)

    with {:ok, %Products{} = products} <- Management.update_products(products, products_params) do
      render(conn, "show.json", products: products)
    end
  end

  def delete(conn, %{"id" => id}) do
    products = Management.get_products!(id)

    with {:ok, %Products{}} <- Management.delete_products(products) do
      send_resp(conn, :no_content, "")
    end
  end
end
