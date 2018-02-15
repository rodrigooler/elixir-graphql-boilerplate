defmodule NiverApp.Models.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias NiverApp.User

  schema "users" do
    field(:active, :boolean, default: false)
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:password, :string)

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [
      :active,
      :email,
      :first_name,
      :last_name,
      :password
    ])
    |> validate_required([
      :active,
      :email,
      :first_name,
      :last_name,
      :password
    ])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end