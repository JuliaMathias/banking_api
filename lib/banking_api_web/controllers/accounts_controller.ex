defmodule BankingApiWeb.AccountsController do
  use BankingApiWeb, :controller

  alias BankingApi.Accounts.Schemas.Account
  alias BankingApi.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback BankingApiWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- BankingApi.deposit_value(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- BankingApi.withdraw_value(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- BankingApi.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end

end
