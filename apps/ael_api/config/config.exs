use Mix.Config

config :phoenix, :json_library, Jason

config :ael_api,
  namespace: Ael,
  known_buckets: {:system, "KNOWN_BUCKETS", "declarations-dev, legal-entities-dev"},
  # seconds
  secrets_ttl: {:system, "SECRETS_TTL", "600"},
  swift_endpoint: {:system, "SWIFT_ENDPOINT", "set_swift_enpoint"},
  swift_tenant_id: {:system, "SWIFT_TENANT_ID", "set_swift_tenant_id"},
  swift_temp_url_key: {:system, "SWIFT_TEMP_URL_KEY", "set_swift_temp_url_key"},
  object_storage_backend: {:system, "OBJECT_STORAGE_BACKEND", "gcs"},
  minio_endpoint: [
    public: {:system, "MINIO_ENDPOINT", nil},
    internal: {:system, "INTERNAL_MINIO_ENDPOINT", nil}
  ],
  new_minio_endpoint: [
    public: {:system, "NEW_MINIO_ENDPOINT", nil},
    internal: {:system, "INTERNAL_NEW_MINIO_ENDPOINT", nil}
  ],
  access_key_id: {:system, "AWS_ACCESS_KEY_ID", nil},
  secret_access_key: {:system, "AWS_SECRET_ACCESS_KEY", nil},
  region: {:system, "AWS_REGION", nil},
  google_cloud_storage: {:system, "SERVICE_ACCOUNT_KEY_PATH", "priv/service_account_key.json"}

config :ael_api, Ael.API.Signature, endpoint: {:system, "DIGITAL_SIGNATURE_ENDPOINT", "http://35.187.186.145"}

# Configures the endpoint
config :ael_api, Ael.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "b9WHCgR5TGcrSnd0TNihII7przcYtrVPnSw4ZAXtHOjAVCLZJDb20CQ0ZP65/xbw",
  render_errors: [view: EView.Views.PhoenixError, accepts: ~w(json)],
  instrumenters: [LoggerJSON.Phoenix.Instruments]

config :logger_json, :backend,
  formatter: EhealthLogger.Formatter,
  metadata: :all

config :logger,
  backends: [LoggerJSON],
  level: :info

import_config "#{Mix.env()}.exs"
