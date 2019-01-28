use Mix.Config

config :ael_api, namespace: Ael

# Configures the endpoint
config :ael_api, Ael.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "b9WHCgR5TGcrSnd0TNihII7przcYtrVPnSw4ZAXtHOjAVCLZJDb20CQ0ZP65/xbw",
  render_errors: [view: EView.Views.PhoenixError, accepts: ~w(json)]

# Configures Elixir's Logger
config :logger, :console,
  format: "$message\n",
  handle_otp_reports: true,
  level: :info

import_config "#{Mix.env()}.exs"
