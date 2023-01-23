import Config

config :user_service, UserService.Repo,
  url: System.get_env("POSTGRES_URL")

config :user_service, UserService.Endpoint,
  http: [port: System.get_env("PORT") || 3000],
  debug_errors: true

config :user_service, dev_routes: true

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime
