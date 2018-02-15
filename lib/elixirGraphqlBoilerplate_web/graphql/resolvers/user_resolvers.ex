defmodule ElixirGraphqlBoilerplate.Resolvers.User do
  alias ElixirGraphqlBoilerplate.Repo
  alias ElixirGraphqlBoilerplate.Models.User

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

  def insert(_params, args, _resolution) do
    %User{}
    |> User.changeset(args)
    |> Repo.insert()
  end
end