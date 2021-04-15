defmodule  BankingApiWeb.UsersView do
  alias BankingApi.{Users.Schemas.User, Accounts.Schemas.Account}

  def render("create.json", %{
    user: %User{
      account: %Account{
        id: account_id, balance: balance},
        id: id,
        name: name}}) do
    %{
      message: "User Created",
      user: %{
        id: id,
        name: name,
        account: %{
          id: account_id,
          balance: balance
        }
      }
    }
  end
end
