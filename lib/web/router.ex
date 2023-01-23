defmodule UserService.Router do
  use UserService.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UserService do
    pipe_through :api

    resources "/users", UsersController, only: [:create, :show, :delete, :update]
  end
end
