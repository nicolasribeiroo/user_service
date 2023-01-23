defmodule UserService.FallbackController do
  use UserService.Web, :controller

  import Ecto.Changeset, only: [traverse_errors: 2]

  def call(conn, {:error, result}) do
    conn
    |> send_resp(400, Poison.encode!(%{message: translate_errors(result)}))
  end

  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Regex.replace(~r"%{(\w+)}", msg, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
