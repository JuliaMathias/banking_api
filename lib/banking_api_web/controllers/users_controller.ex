defmodule BankingApiWeb.UsersController do
  use BankingApiWeb, :controller

  alias BankingApi.Users.Schemas.User

  def create(conn, params) do
    params
    |> BankingApi.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end
end
