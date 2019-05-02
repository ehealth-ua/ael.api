defmodule Ael.Rpc do
  @moduledoc """
  This module contains functions that are called from other pods via RPC.
  """

  alias Ael.Secrets.API
  alias Ael.Secrets.Secret
  alias Ael.Utils
  alias Ael.Web.SecretView

  @type secret :: %{
          action: binary(),
          bucket: binary(),
          expires_at: binary(),
          inserted_at: DateTime,
          resource_id: binary(),
          resource_name: binary(),
          secret_url: binary()
        }

  @doc """
  Create signed url from params

  ## Examples

      iex> Ael.Rpc.signed_url(%{
        "action" => "PUT",
        "bucket" => "declarations-dev",
        "content_type" => "application/pdf",
        "resource_id" => "f7f817b2-3134-4625-b87d-e2d7fc8e9b90",
        "resource_name" => "signed_content"
      })
      {:ok,
      %{
        action: "PUT",
        bucket: "declarations-dev",
        expires_at: "2019-05-01T22:38:35Z",
        inserted_at: #DateTime<2019-05-01 22:28:35.391988Z>,
        resource_id: "f7f817b2-3134-4625-b87d-e2d7fc8e9b90",
        resource_name: "signed_content",
        secret_url: "https://storage.googleapis.com/declarations-dev/f7f817b2-3134-4625-b87d-e2d7fc8e9b90/signed_content?GoogleAccessId=ael-dev@ehealth-162117.iam.gserviceaccount.com&Expires=1556750315&Signature=LRS1GJxEVeFtGEHicLP02eTyq3QUD4dSwqN9iGKcUzKBdNmmGh50AyreH%2FSsZenZiZmhbjqfMyUGuCZof8Lq59dFe0d3EPJInzxfhuYDKvlVkGjKLCeeVlgJIFY3DCUpZyOMZfEXgZDV1aFYUggBrVCaU3fRDFYR0evs1CXPe3TJYzYqs5B7enNGIG8Z77AWAOUQdASrDzw4ubrB7FKLB6nw9aD7nXa1zC%2F0%2BF6TLMwk6qQlKo4U93CGccPuPfOMeRM6gUYtFWSWELbftMspkNW0qF99lgCJpMNMHEQcNlBotaA4djq19am8SJJkfs1FNRifNgPgbDViOrWXThbhBQ%3D%3D"
      }}
  """
  @spec signed_url(params :: map) :: {:ok, secret} | {:error, map}
  def signed_url(params) do
    backend = Utils.get_from_registry(:object_storage_backend)

    with {:ok, %Secret{} = secret} <- API.create_secret(params, backend) do
      {:ok, SecretView.render("show.json", %{secret: secret})}
    end
  end
end
