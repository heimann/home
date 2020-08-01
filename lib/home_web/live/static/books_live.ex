defmodule HomeWeb.BooksLive do
  use HomeWeb, :live_view
  alias Home.Reading

  @impl true
  def mount(_params, _session, socket) do
    books =
      Reading.all_categories()
      |> Enum.map(fn c -> {c, Reading.list_books(c)} end)

    {:ok, assign(socket, :books, books)}
  end
end
