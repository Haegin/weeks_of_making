defmodule WeeksOfMaking.Router do
  use WeeksOfMaking.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeeksOfMaking do
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController
    get "/", PageController, :index
  end

  scope "/auth", WeeksOfMaking do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", WeeksOfMaking do
  #   pipe_through :api
  # end
end
