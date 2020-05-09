defmodule HomeWeb.NotesLive.Index do
  use HomeWeb, :live_view

  def mount(_, _, socket) do
    {:ok, socket}
  end
end
