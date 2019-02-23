defmodule Ael.Web.Endpoint do
  @moduledoc """
  Phoenix Endpoint for ael_api application.
  """
  use Phoenix.Endpoint, otp_app: :ael_api

  plug(Plug.RequestId)
  plug(EView.Plugs.Idempotency)
  plug(LoggerJSON.Plug, level: Logger.level())

  plug(
    Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)

  plug(Ael.Web.Router)
end
