defmodule Ael.Web.Router do
  @moduledoc """
  The router provides a set of macros for generating routes
  that dispatch to specific controllers and actions.
  Those macros are named after HTTP verbs.

  More info at: https://hexdocs.pm/phoenix/Phoenix.Router.html
  """

  use Ael.Web, :router
  require Logger

  pipeline :api do
    plug(:accepts, ["json"])
    plug(:put_secure_browser_headers)
    plug(EView)
  end

  scope "/", Ael.Web do
    pipe_through(:api)

    post("/media_content_storage_secrets", SecretController, :create)
    post("/validate_signed_entity", SecretController, :validate)
  end
end
