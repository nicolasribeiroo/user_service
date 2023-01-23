defmodule UserService.Router do
  use UserService.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UserService do
    pipe_through :api

    get "/hello-world", HelloWorldController, :execute
  end
end
