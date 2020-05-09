defmodule Home.Notes do
  alias Home.Notes.Note

  for app <- [:earmark, :makeup_elixir] do
    Application.ensure_all_started(app)
  end

  notes_paths = "notes/**/*.md" |> Path.wildcard() |> Enum.sort()

  notes =
    for note_path <- notes_paths do
      @external_resource Path.relative_to_cwd(note_path)
      Note.parse!(note_path)
    end

  @notes notes

  def all_notes do
    @notes
  end

  def get_note_by_title(title) do
    all_notes()
    |> Enum.find(&(&1.title == title))
  end

  def get_note_by_slug(slug) do
    all_notes()
    |> Enum.find(&(&1.slug == slug))
  end
end
