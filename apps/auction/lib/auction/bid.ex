defmodule Auction.Bid do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bids" do
    field(:amount, :integer)
    belongs_to(:item, Auction.Item)
    belongs_to(:user, Auction.User)
    timestamps()
  end

  def changeset(bid, params \\ %{}) do
    bid
    |> cast(params, [:amount, :user_id, :item_id])
    |> validate_required([:amount, :user_id, :item_id])
    |> assoc_constraint(:item)
    |> assoc_constraint(:user)
  end

  def changeset_higher_bid(bid, params \\ %{}, opts \\ %{}) do
    bid
    |> changeset(params)
    |> validate_change(:amount, &validate(&1, &2, opts))
  end

  defp validate(:amount, amount, opts \\ %{amount: 0}) do
    higher_amount = Map.get(opts, :amount)

    case higher_amount > amount do
      true -> [amount: "Bid too low"]
      false -> []
    end
  end
end
