defmodule ElixirGraphqlBoilerplate.Resolvers.User do
    alias ElixirGraphqlBoilerplate.Repo
    alias ElixirGraphqlBoilerplate.User
  
    def get(_parent, %{id: id}, _resolution) do
      case Repo.get(User, id) do
        nil ->
          {:error, "User ID #{id} not found"}
  
        user ->
          {:ok, user}
      end
    end
  
    def all(_params, _args, _resolution) do
      {:ok, Repo.all(User)}
    end
  
    def all() do
      {:ok, Repo.all(User)}
    end
  
    def insert(_params, args, _resolution) do
      %User{}
      |> User.changeset(args)
      |> Repo.insert()
    end
  
    def login(_params, args, _resolution) do
      case Repo.get_by(User, email: args.email, password: args.password) do
        nil ->
          {:error, "Incorrect user or password, please enter again"}
  
        user ->
          {:ok, user}
      end
    end
  end
  