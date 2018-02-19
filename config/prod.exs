use Mix.Config

config :ael_api, Ael.Web.Endpoint,
  http: [port: "${PORT}"],
  secret_key_base: "${SECRET_KEY}",
  debug_errors: false,
  code_reloader: false

# Configures Digital Signature API
config :ael_api, Ael.API.Signature, endpoint: "${DIGITAL_SIGNATURE_ENDPOINT}"

config :ael_api,
  known_buckets: "${KNOWN_BUCKETS}",
  secrets_ttl: "${SECRETS_TTL}",
  swift_endpoint: "${SWIFT_ENDPOINT}",
  swift_tenant_id: "${SWIFT_TENANT_ID}",
  swift_temp_url_key: "${SWIFT_TEMP_URL_KEY}",
  object_storage_backend: "${OBJECT_STORAGE_BACKEND}",
  minio_endpoint: "${MINIO_ENDPOINT}",
  access_key_id: "${AWS_ACCESS_KEY_ID}",
  secret_access_key: "${AWS_SECRET_ACCESS_KEY}",
  region: "${AWS_REGION}",
  google_cloud_storage: "${SERVICE_ACCOUNT_KEY_PATH}"

config :phoenix, :serve_endpoints, true
