defmodule Ael do
  @moduledoc """
  This is an entry point of ael_api application.
  """
  use Application
  alias Ael.Web.Endpoint

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(Ael.Web.Endpoint, []),
      supervisor(Registry, [:unique, Ael.Registry])
      # Starts a worker by calling: Ael.Worker.start_link(arg1, arg2, arg3)
      # worker(Ael.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ael.Supervisor]

    application = Supervisor.start_link(children, opts)
    register_gcs_config()

    application
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Endpoint.config_change(changed, removed)
    :ok
  end

  def register_gcs_config do
    gcs_service_account = load_gcs_service_config()

    der =
      gcs_service_account
      |> Map.get("private_key")
      |> :public_key.pem_decode()
      |> List.first()
      |> :public_key.pem_entry_decode()

    Registry.register(Ael.Registry, :gcs_service_account_id, Map.get(gcs_service_account, "client_email"))
    Registry.register(Ael.Registry, :gcs_service_account_key, der)
    Registry.register(Ael.Registry, :secrets_ttl, Application.get_env(:ael_api, :secrets_ttl))
    Registry.register(Ael.Registry, :known_buckets, Application.get_env(:ael_api, :known_buckets))
    Registry.register(Ael.Registry, :object_storage_backend, Application.get_env(:ael_api, :object_storage_backend))
    Registry.register(Ael.Registry, :swift_endpoint, Application.get_env(:ael_api, :swift_endpoint))
    Registry.register(Ael.Registry, :swift_tenant_id, Application.get_env(:ael_api, :swift_tenant_id))
    Registry.register(Ael.Registry, :swift_temp_url_key, Application.get_env(:ael_api, :swift_temp_url_key))
  end

  def load_gcs_service_config do
    :ael_api
    |> Application.get_env(:google_cloud_storage)
    |> File.read!()
    |> Poison.decode!()
  end
end
