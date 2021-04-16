defmodule BankingApi.Users.CreateTest do
  @moduledoc """
  Documentation
  """
  use BankingApi.DataCase, async: true

  alias BankingApi.Users.Schemas.User
  alias BankingApi.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "FakeName",
        password: "FakePassword",
        email: "Fake@email.com",
      }

      {:ok, %User{id: user_id}} = Create.call(params)

      user = Repo.get(User, user_id)

      assert %User{name: "FakeName", id: ^user_id} = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "FakeName",
        email: "Fake@email.com",
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
