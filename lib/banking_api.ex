defmodule BankingApi do
  @moduledoc """
  BankingApi keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias BankingApi.Users.Create, as: UserCreate
  alias BankingApi.Accounts.{Deposit, Withdraw, Transaction}

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit_value(params), to: Deposit, as: :call
  defdelegate withdraw_value(params), to: Withdraw, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end
