# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixirGraphqlBoilerplate.Repo.insert!(%ElixirGraphqlBoilerplate.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

1..100
|> Enum.each(fn _ ->
  Repo.insert!(%User{
    first_name: Faker.Name.first_name(),
    last_name: Faker.Name.last_name(),
    email: Faker.Internet.free_email(),
    password: Faker.String.base64()
  })
end)