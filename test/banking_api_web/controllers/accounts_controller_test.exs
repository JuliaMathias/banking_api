defmodule BankingApiWeb.AccountsControllerTest do
  @moduledoc """
  Documentation
  """
  use BankingApiWeb.ConnCase, async: true

  alias BankingApi.{Accounts.Schemas.Account, Users.Schemas.User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "FakeName",
        password: "FakePassword",
        email: "Fake@email.com",
      }

      {:ok, %User{account: %Account{id: account_id}}} = BankingApi.create_user(params)

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      expected_response = %{
        "account" => %{"balance" => "1050.00", "id" => account_id},
        "message" => "Ballance changed Successfully"
      }

      assert response == expected_response
    end

    test "when there are invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banana"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid value!"}

      assert response == expected_response
    end
  end

  describe "withdraw/2" do
    setup %{conn: conn} do
      params = %{
        name: "FakeName",
        password: "FakePassword",
        email: "Fake@email.com",
      }

      {:ok, %User{account: %Account{id: account_id}}} = BankingApi.create_user(params)

      BankingApi.deposit_value(%{"id" => account_id, "value" => "500.00"})

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the withdraw", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :withdraw, account_id, params))
        |> json_response(:ok)

      expected_response = %{
        "account" => %{"balance" => "1450.00", "id" => account_id},
        "message" => "Ballance changed Successfully"
      }

      assert response == expected_response
    end

    test "when there are invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banana"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid value!"}

      assert response == expected_response
    end
  end
end
