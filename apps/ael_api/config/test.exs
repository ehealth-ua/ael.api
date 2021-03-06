use Mix.Config

# Configuration for test environment
config :ex_unit, capture_log: true

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ael_api, Ael.Web.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Run acceptance test in concurrent mode
config :ael_api,
  sql_sandbox: true,
  mock: [port: 4040],
  minio_endpoint: [
    public: "",
    internal: "internal.com"
  ],
  access_key_id: "",
  secret_access_key: ""

# Configures Digital Signature API
config :ael_api, Ael.API.Signature, endpoint: "http://localhost:4040"
