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

config :ael_api,
  known_buckets: "declarations-dev, legal-entities-dev",
  # seconds
  secrets_ttl: "600",
  swift_endpoint: "set_swift_enpoint",
  swift_tenant_id: "set_swift_tenant_id",
  swift_temp_url_key: "set_swift_temp_url_key",
  object_storage_backend: "gcs",
  minio_endpoint: System.get_env("MINIO_ENDPOINT"),
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: System.get_env("AWS_REGION"),
  google_cloud_storage: "priv/service_account_key.json"

import_config "#{Mix.env()}.exs"
