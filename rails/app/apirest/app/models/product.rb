class Product
  include Mongoid::Document

  field :sku, type: String
  field :name, type: String
  field :description, type: String
  field :amount, type: Integer
  field :price, type: Float

  validates_presence_of :sku, :name, :description, :amount, :price
end
