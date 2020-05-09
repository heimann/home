defmodule HomeWeb.NotesLive do
  use HomeWeb, :live_view

  def mount(_, _, socket) do
    {:ok, socket}
  end
end
