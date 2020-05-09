defmodule AuctionWeb.LicenseLive do
  use Phoenix.LiveView
  alias Auction.License

  import Number.Currency

  def mount(_params, _session, socket) do
    {:ok, assign(socket, seats: 2, amount: License.calculate(2))}
  end

  def render(assigns) do
    ~L"""
    <h1>License Calculator</h1>
    <p>I want to purchase: <%= @seats %> seats</p>
    <form phx-change="update"> 
      <label for="points">Points (between 1 and 100):</label>
      <input type="range" name="seats" min="1" max="100" value="<%= @seats %>">
    </form>
    <p>Amount: <%= number_to_currency(@amount) %>
    <div>
      <button phx-click="up">+</button>
      <button phx-click="down">-</button>
    </div>
    """
  end

  def handle_event("update", %{"seats" => seats}, socket) do
    seats = String.to_integer(seats)

    {:noreply,
     socket
     |> assign(seats: seats, amount: License.calculate(seats))}
  end

  def handle_event("up", _, socket) do
  end

  def handle_event("down", _, socket) do
    {:noreply, update(socket, :progress, &(&1 - 10))}
  end
end
