defmodule Myapp.Repo do
  use Ecto.Repo,
    otp_app: :myapp,
    adapter: Mongo.Ecto
end
