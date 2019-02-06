use Mix.Config

config :ael_api, Ael.Web.Endpoint,
  http: [port: {:system, "PORT", "80"}],
  secret_key_base: {:system, "SECRET_KEY"},
  debug_errors: false,
  code_reloader: false

config :phoenix, :serve_endpoints, true
