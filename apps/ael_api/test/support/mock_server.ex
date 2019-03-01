defmodule Ael.MockServer do
  @moduledoc false

  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/declaration_signed_content" do
    Plug.Conn.send_resp(
      conn,
      200,
      Jason.encode!(%{
        "data" => %{
          "content" => %{
            "legal_entity" => %{
              "id" => "1bce381a-7b82-11e7-bb31-be2e44b06b34"
            }
          },
          "signatures" => [
            %{
              "is_valid" => true,
              "signer" => %{
                "common_name" => "Some Common Name",
                "country_name" => "UA",
                "drfo" => "1234567890",
                "edrpou" => "",
                "given_name" => "Some Name",
                "locality_name" => "Kyiv",
                "organization_name" => "",
                "organizational_unit_name" => "",
                "state_or_province_name" => "Kyiv",
                "surname" => "Some",
                "title" => ""
              },
              "validation_error_message" => ""
            }
          ]
        }
      })
    )
  end

  get "/declaration_signed_content_not_valid" do
    Plug.Conn.send_resp(
      conn,
      200,
      Jason.encode!(%{
        "data" => %{
          "content" => %{
            "legal_entity" => %{
              "id" => "1bce381a-7b82-11e7-bb31-be2e44b06b34"
            }
          },
          "signatures" => [
            %{
              "is_valid" => false,
              "signer" => %{
                "common_name" => "Some Common Name",
                "country_name" => "UA",
                "drfo" => "1234567890",
                "edrpou" => "",
                "given_name" => "Some Name",
                "locality_name" => "Kyiv",
                "organization_name" => "",
                "organizational_unit_name" => "",
                "state_or_province_name" => "Kyiv",
                "surname" => "Some",
                "title" => ""
              },
              "validation_error_message" => "not valid"
            }
          ]
        }
      })
    )
  end

  post "/digital_signatures" do
    {:ok, body, conn} = Plug.Conn.read_body(conn)
    body = Jason.decode!(body)
    Plug.Conn.send_resp(conn, 200, Base.decode64!(body["signed_content"]))
  end
end
