defmodule UserService.Endpoint do
  use Phoenix.Endpoint, otp_app: :user_service

  plug Plug.RequestId
  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug UserService.Router
end
