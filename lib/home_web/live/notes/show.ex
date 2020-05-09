defmodule HomeWeb.NotesLive.Show do
  use HomeWeb, :live_view
  alias Home.Notes

  def mount(%{"slug" => slug} = _params, _session, socket) do
    note = Notes.get_note_by_slug(slug)
    {:ok, assign(socket, note: note)}
  end
end
