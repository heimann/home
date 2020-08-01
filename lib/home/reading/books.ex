defmodule Home.Reading.Books do
  alias Home.Reading.Book

  @books [
    %Book{
      category: "Science Fiction",
      title: "Dune",
      author: "Frank Herbert",
      url:
        "https://www.goodreads.com/book/show/44767458-dune?from_search=true&from_srp=true&qid=1H3AdWvXRR&rank=1",
      isbn: "9780593099322"
    },
    %Book{
      category: "Science Fiction",
      title: "The Foundation Trilogy",
      author: "Isaac Asimov",
      url:
        "https://www.goodreads.com/book/show/46654.The_Foundation_Trilogy?from_search=true&from_srp=true&qid=owYvSbguok&rank=4",
      isbn: "9780380508563"
    },
    %Book{
      category: "Science Fiction",
      title: "Marooned in Realtime",
      author: "Vernor Vinge",
      url:
        "https://www.goodreads.com/book/show/167847.Marooned_in_Realtime?from_search=true&from_srp=true&qid=CImuXAO41B&rank=1",
      isbn: "9780765308849",
      note:
        "The second book in a series, first one is worth reading but you can absolutely read this without having read the prequel"
    },
    %Book{
      category: "Science Fiction",
      title: "A Deepness in the Sky",
      author: "Vernor Vinge",
      url:
        "https://www.goodreads.com/book/show/226004.A_Deepness_in_the_Sky?ac=1&from_search=true&qid=yp6Bs9nfWe&rank=1",
      isbn: "9780812536355",
      note: "Part of a series but does well on it's own"
    },
    %Book{
      category: "Science Fiction",
      title: "True Names",
      author: "Vernor Vinge",
      url:
        "https://www.goodreads.com/book/show/1280983.True_Names?from_search=true&from_srp=true&qid=1OEVsEPk2R&rank=5",
      isbn: "9780312944445"
    },
    %Book{
      category: "Creation Stories / Myths",
      title:
        "Prisoner's Dilemma: John von Neumann, Game Theory, and the Puzzle of the Bomb",
      author: "William Poundstone",
      url:
        "https://www.goodreads.com/book/show/29506.Prisoner_s_Dilemma?from_search=true&from_srp=true&qid=JsqVJ7l8iO&rank=2",
      isbn: "9780385415804"
    }
  ]

  def all_books, do: @books
end
