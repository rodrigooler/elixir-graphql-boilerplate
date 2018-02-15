defmodule ElixirGraphqlBoilerplate.Types.User do
  use Absinthe.Schema.Notation

  @desc "A user of the ElixirGraphqlBoilerplate"
  object :user do
    field(:id, :id)
    field(:active, :boolean)
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
  end
end