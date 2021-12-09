defmodule ApiProducts.Management.Products do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "products" do
    field :sku, :string
    field :name, :string
    field :description, :string
    field :amount, :integer
    field :price, :float


    timestamps()
  end

  def changeset(products, attrs) do
    products
    |> cast(attrs, [:sku, :name, :description, :amount, :price])
    |> validate_required([:sku, :name, :description, :amount, :price])
  end
end
