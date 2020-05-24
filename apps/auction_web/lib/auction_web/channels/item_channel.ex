defmodule AuctionWeb.ItemChannel do
  use Phoenix.Channel

  def handle_in("new_bid", params, socket) do
    broadcast!(socket, "new_bid", params)
    {:noreply, socket}
  end

  def join("item:" <> _item_id, _params, socket) do
    {:ok, socket}
  end
end
