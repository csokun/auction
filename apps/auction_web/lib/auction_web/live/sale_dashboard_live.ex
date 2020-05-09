defmodule AuctionWeb.SaleDashboardLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tick)
    socket = assigns_socket(socket)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <p>Sale: <%= @sale %></p>
    """
  end

  def handle_info(:tick, socket) do
    socket = assigns_socket(socket)
    {:noreply, socket}
  end

  defp assigns_socket(socket) do
    assign(socket, sale: Enum.random(1..100))
  end
end
