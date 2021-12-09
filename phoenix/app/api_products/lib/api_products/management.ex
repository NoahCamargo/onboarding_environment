defmodule ApiProducts.Management do

  import Ecto.Query, warn: false
  alias ApiProducts.Repo

  alias ApiProducts.Management.Products

  def list_myapp_development do
    Repo.all(Products)
  end

  def get_products!(id), do: Repo.get!(Products, id)

  def create_products(attrs \\ %{}) do
    %Products{}
    |> Products.changeset(attrs)
    |> Repo.insert()
  end

  def update_products(%Products{} = products, attrs) do
    products
    |> Products.changeset(attrs)
    |> Repo.update()
  end

  def delete_products(%Products{} = products) do
    Repo.delete(products)
  end

  def change_products(%Products{} = products, attrs \\ %{}) do
    Products.changeset(products, attrs)
  end
end
