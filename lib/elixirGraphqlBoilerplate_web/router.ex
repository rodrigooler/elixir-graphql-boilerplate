defmodule ElixirGraphqlBoilerplateWeb.Router do
  use ElixirGraphqlBoilerplateWeb, :router

  pipeline :graphql do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:graphql)

    forward("/graphql", Absinthe.Plug, schema: ElixirGraphqlBoilerplateWeb.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: ElixirGraphqlBoilerplateWeb.Schema)
    end
  end
end