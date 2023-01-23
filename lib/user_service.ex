defmodule UserService do
  use Application

  def start(_type, _args) do
    unless Mix.env() == :prod do
      Dotenv.load()
      Mix.Task.run("loadconfig")
    end

    children = [
      UserService.Endpoint,
      UserService.Repo,
      {Phoenix.PubSub, name: UserService.PubSub}
    ]

    opts = [strategy: :one_for_one, name: UserService.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    UserService.Endpoint.config_change(changed, removed)
    :ok
  end

  defdelegate create_user(params), to: UserService.User.Create, as: :call
end
