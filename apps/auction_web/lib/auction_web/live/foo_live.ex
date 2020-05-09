defmodule AuctionWeb.FooLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, msg: "Sokun", progress: 10)}
  end

  def render(assigns) do
    ~L"""
    <h1>Hi!</h1>
    <div phx-window-keydown="keydown" phx-throttle="500">
    <%= @msg %>
    </div>
    <p>
    Progress: <%= @progress %>
    </p>
    <button phx-click="up">+</button>
    <button phx-click="down">-</button>
    """
  end

  def handle_event("keydown", %{"key" => key}, socket) do
    {:noreply, assign(socket, msg: key)}
  end

  def handle_event("up", _, socket) do
    {:noreply, update(socket, :progress, &(&1 + 10))}
  end

  def handle_event("down", _, socket) do
    {:noreply, update(socket, :progress, &(&1 - 10))}
  end
end
