defmodule  BankingApiWeb.UsersView do
  alias BankingApi.Users.Schemas.User

  def render( "create.json", %{ user: %User{id: id, name: name } } ) do
    %{
      message: "User Created",
      user: %{
        id: id,
        name: name
        }
    }
  end
end
