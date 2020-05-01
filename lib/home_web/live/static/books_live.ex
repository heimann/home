defmodule HomeWeb.BooksLive do
  use HomeWeb, :live_view
  alias Home.Airtable

  @impl true
  def mount(_params, _session, socket) do
    books =
      ConCache.get_or_store(:dmeh_cache, "books", fn ->
        Airtable.books()
      end)

    {:ok, assign(socket, :books, books)}
  end
end
