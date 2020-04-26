defmodule HomeWeb.BooksLive do
  use HomeWeb, :live_view
  alias Home.Airtable

  @impl true
  def mount(_params, _session, socket) do
    books = Airtable.books()
    {:ok, assign(socket, :books, books)}
  end
end
