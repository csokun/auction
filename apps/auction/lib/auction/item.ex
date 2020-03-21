defmodule Auction.Item do
  use Ecto.Schema

  # defstruct [:id, :title, :description, :ends_at]

  schema "items" do
    field(:title, :string)
    field(:description, :string)
    field(:ends_at, :utc_datetime)

    # data will have inserted_at and updated_at
    timestamps()
  end
end
