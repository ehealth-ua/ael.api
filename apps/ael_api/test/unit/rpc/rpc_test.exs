defmodule Ael.RpcTest do
  @moduledoc false

  use ExUnit.Case
  alias Ael.Rpc
  alias Ecto.UUID

  describe "signed_url/1" do
    test "success create secret" do
      id = UUID.generate()
      bucket = "declarations-dev"
      action = "PUT"
      resource_name = "signed_content"

      assert {:ok,
              %{
                action: ^action,
                bucket: ^bucket,
                expires_at: _,
                inserted_at: _,
                resource_id: ^id,
                resource_name: ^resource_name,
                secret_url: _
              }} =
               Rpc.signed_url(%{
                 "action" => action,
                 "bucket" => bucket,
                 "resource_id" => id,
                 "resource_name" => resource_name,
                 "content_type" => "application/pdf"
               })
    end

    test "invalid bucket" do
      assert {:error,
              %{
                errors: [bucket: {"is invalid", [validation: :inclusion]}],
                valid?: false
              }} =
               Rpc.signed_url(%{
                 "action" => "GET",
                 "bucket" => "invalid",
                 "resource_id" => UUID.generate(),
                 "resource_name" => "signed_content"
               })
    end

    test "invalid changeset" do
      assert {:error,
              %{
                errors: [
                  action: {"can't be blank", [validation: :required]},
                  bucket: {"can't be blank", [validation: :required]},
                  resource_id: {"can't be blank", [validation: :required]}
                ],
                valid?: false
              }} = Rpc.signed_url(%{})
    end
  end
end
