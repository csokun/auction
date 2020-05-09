defmodule AuctionWeb.Router do
  use AuctionWeb, :router
  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    # plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug AuctionWeb.Authenticator
    plug :put_root_layout, {AuctionWeb.LayoutView, :root}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AuctionWeb do
    pipe_through :browser

    live_dashboard "/dashboard", metrics: AuctionWeb.Telemetry
    get "/", PageController, :index

    resources "/items", ItemsController do
      resources "/bids", BidController, only: [:create]
    end

    resources "/users", UserController, only: [:new, :show, :create]

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
    get "/session", SessionController, :show

    live "/foo", FooLive
    live "/license", LicenseLive
    live "/sales", SaleDashboardLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", AuctionWeb do
  #   pipe_through :api
  # end
end
