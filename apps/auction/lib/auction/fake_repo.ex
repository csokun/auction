defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item{
      id: 1,
      title: "My first item",
      description: "A tasty item sure to please",
      ends_at: ~N[2020-01-01 00:00:00]
    },
    %Item{
      id: 2,
      title: "WarGames Bluray",
      description: "The best computer movie of all time, now on Bluray",
      ends_at: ~N[2020-10-01 00:00:00]
    },
    %Item{
      id: 1,
      title: "U2 - Achtung Baby on CD",
      description: "The sound of 4 men chopping down the Joshua Tree",
      ends_at: ~N[2020-11-05 03:12:00]
    }
  ]

  def all(Item), do: @items

  def get!(Item, id) do
    Enum.find(@items, fn item -> item.id == id end)
  end

  def get_by(Item, map) do
    Enum.find(@items, fn item ->
      Enum.all?(Map.keys(map), fn key ->
        Map.get(item, key) === map[key]
      end)
    end)
  end
end
