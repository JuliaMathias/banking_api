defmodule BankingApi.Users.Create do
  @moduledoc """
  Let's create some users!
  """

  alias BankingApi.Repo
  alias BankingApi.Users.Schemas.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
