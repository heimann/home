defmodule Home.Notes do
  alias Home.Notes.Note

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
end
