# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# By default, the umbrella project as well as each child
# application will require this configuration file, ensuring
# they all use the same configuration. While one could
# configure all applications here, we prefer to delegate
# back to each application for organization purposes.

config :ael_api,
  known_buckets: "declarations-dev, legal-entities-dev",
  # seconds
  secrets_ttl: "600",
  swift_endpoint: "set_swift_enpoint",
  swift_tenant_id: "set_swift_tenant_id",
  swift_temp_url_key: "set_swift_temp_url_key",
  object_storage_backend: "gcs",
  minio_endpoint: System.get_env("MINIO_ENDPOINT"),
  new_minio_endpoint: System.get_env("NEW_MINIO_ENDPOINT"),
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: System.get_env("AWS_REGION"),
  google_cloud_storage: "priv/service_account_key.json"

config :git_ops,
  mix_project: AelApi.MixProject,
  changelog_file: "CHANGELOG.md",
  repository_url: "https://github.com/edenlabllc/ael.api/",
  types: [
    # Makes an allowed commit type called `tidbit` that is not
    # shown in the changelog
    tidbit: [
      hidden?: true
    ],
    # Makes an allowed commit type called `important` that gets
    # a section in the changelog with the header "Important Changes"
    important: [
      header: "Important Changes"
    ]
  ],
  # Instructs the tool to manage your mix version in your `mix.exs` file
  # See below for more information
  manage_mix_version?: true,
  # Instructs the tool to manage the version in your README.md
  # Pass in `true` to use `"README.md"` or a string to customize
  manage_readme_version: "README.md"

import_config "../apps/*/config/config.exs"
