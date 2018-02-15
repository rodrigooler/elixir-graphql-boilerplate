defmodule ElixirGraphqlBoilerplate.Repo.Migrations.CreateUsers do
    use Ecto.Migration
  
    def change do
      create table(:users) do
        add(:active, :boolean, default: false, null: false)
        add(:email, :string)
        add(:first_name, :string)
        add(:last_name, :string)
        add(:password, :string)
  
        timestamps()
      end
    end
  end