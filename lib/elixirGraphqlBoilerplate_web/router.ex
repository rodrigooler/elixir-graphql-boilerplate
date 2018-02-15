defmodule ElixirGraphqlBoilerplateWeb.Router do
  use ElixirGraphqlBoilerplateWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirGraphqlBoilerplateWeb do
    pipe_through :api
  end
end
