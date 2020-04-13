defmodule AuctionWeb.FooLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, msg: "Sokun")}
  end

  def render(assigns) do
    ~L"""
    <h1>Hi!</h1>
    <div phx-window-keydown="keydown" phx-throttle="500">
    <%= @msg %>
    </div>
    """
  end

  def handle_event("keydown", %{"key" => key}, socket) do
    {:noreply, assign(socket, msg: key)}
  end
end
