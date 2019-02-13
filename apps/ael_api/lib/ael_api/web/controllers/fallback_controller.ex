defmodule Ael.Web.FallbackController do
  @moduledoc """
  This controller should be used as `action_fallback` in rest of controllers to remove duplicated error handling.
  """
  use Ael.Web, :controller
  alias EView.Views.Error
  alias EView.Views.ValidationError

  def call(conn, {:error, :access_denied}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(Error)
    |> render(:"401")
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ValidationError)
    |> render(:"422", changeset)
  end
end
