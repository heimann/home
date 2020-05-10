defmodule Home.Writing do
  alias Home.Writing.Text

  for app <- [:earmark, :makeup_elixir] do
    Application.ensure_all_started(app)
  end

  text_paths = "writing/**/*.md" |> Path.wildcard() |> Enum.sort()

  texts =
    for text_path <- text_paths do
      @external_resource Path.relative_to_cwd(text_path)
      Text.parse!(text_path)
    end

  @texts texts

  def all_texts do
    @texts
  end

  def get_text_by_title(title) do
    all_texts()
    |> Enum.find(&(&1.title == title))
  end

  def get_text_by_slug(slug) do
    all_texts()
    |> Enum.find(&(&1.slug == slug))
  end
end
