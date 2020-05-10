defmodule Home.Writing.Text do
  @enforce_keys [:title, :slug, :body, :description, :tags, :date]
  defstruct [:title, :slug, :body, :description, :tags, :date]

  def parse!(filename) do
    contents = parse_contents(File.read!(filename))

    slug =
      Keyword.get(contents, :title)
      |> Slug.slugify()

    struct!(__MODULE__, contents ++ [slug: slug])
  end

  defp parse_contents(contents) do
    parts =
      Regex.split(~r/^===(\w+)===\n/m, contents,
        include_captures: true,
        trim: true
      )

    for [attr_with_equals, value] <- Enum.chunk_every(parts, 2) do
      [_, attr, _] = String.split(attr_with_equals, "===")
      attr = String.to_atom(attr)
      {attr, parse_attr(attr, value)}
    end
  end

  defp parse_attr(:title, value),
    do: String.trim(value)

  defp parse_attr(:description, value),
    do: String.trim(value)

  defp parse_attr(:body, value),
    do:
      value
      |> Earmark.as_html!(%Earmark.Options{
        smartypants: false,
        code_class_prefix: "language-"
      })

  defp parse_attr(:tags, value),
    do: String.trim(value)

  defp parse_attr(:date, value),
    do: String.trim(value)
end
