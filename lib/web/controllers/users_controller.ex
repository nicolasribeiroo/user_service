defmodule UserService.UsersController do
  alias UserService.UsersController
  use UserService.Web, :controller

  action_fallback UserService.FallbackController

  def create(conn, params) do
    params
    |> UserService.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(
      200,
      Poison.encode!(%{
        success: true,
        data: %{
          id: user.id,
          password: user.password,
          name: user.name
        }
      })
    )
  end

  defp handle_response({:error , _changeset} = error, _conn), do: error
end
