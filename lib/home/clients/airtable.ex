defmodule Home.Airtable do
  use Tesla
  require Logger

  plug Tesla.Middleware.BaseUrl, System.get_env("AIRTABLE_URL")

  plug Tesla.Middleware.Headers, [
    {"Authorization", "Bearer #{System.get_env("AIRTABLE_API_KEY")}"}
  ]

  plug Tesla.Middleware.JSON

  def books() do
    {:ok, response} = get("/Books")

    response.body
    |> Map.get("records")
  end
end
