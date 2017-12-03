ExUnit.start()
{:ok, _} = Plug.Adapters.Cowboy.http Ael.MockServer, [], port: Application.get_env(:ael_api, :mock)[:port]
