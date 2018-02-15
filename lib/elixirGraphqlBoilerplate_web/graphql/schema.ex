defmodule ElixirGraphqlBoilerplate.Schema do
  use Absinthe.Schema
  alias ElixirGraphqlBoilerplate.Resolvers

  import_types(ElixirGraphqlBoilerplate.Types.User)

  query do
    @desc "Get user"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.User.get/3)
    end

    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(&Resolvers.User.all/3)
    end
  end

  mutation do
    @desc "Insert user"
    field :create_user, :user do
      arg(:active, non_null(:boolean))
      arg(:email, non_null(:string))
      arg(:first_name, non_null(:string))
      arg(:last_name, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.User.insert/3)
    end
  end
end