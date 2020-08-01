defmodule Home.Reading do
  alias Home.Reading.Books

  def all_categories() do
    list_books()
    |> Enum.map(& &1.category)
    |> Enum.uniq()
  end

  def list_books() do
    Books.all_books()
  end

  def list_books(category) do
    Books.all_books()
    |> Enum.filter(&(&1.category == category))
    |> Enum.sort_by(& &1.author)
  end
end
