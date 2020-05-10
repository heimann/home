defmodule HomeWeb.WritingLive.Show do
  use HomeWeb, :live_view
  alias Home.Writing

  def mount(%{"slug" => slug} = _params, _session, socket) do
    text = Writing.get_text_by_slug(slug)
    {:ok, assign(socket, text: text)}
  end
end
