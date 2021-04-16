defmodule BankingApiWeb.UsersViewTest do
  @moduledoc """
  Documentation
  """
  use BankingApiWeb.ConnCase, async: true

  import Phoenix.View

  alias BankingApi.{Accounts.Schemas.Account, Users.Schemas.User}
  alias BankingApiWeb.UsersView

  test "render create.json" do
    params = %{
      name: "FakeName",
      password: "FakePassword",
      email: "Fake@email.com",
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      BankingApi.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User Created",
      user: %{
        account: %{balance: Decimal.new("1000.00"), id: account_id},
        id: user_id,
        name: "FakeName",
      }
    }

    assert response == expected_response
  end
end
