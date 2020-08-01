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
    },
    %Book{
      category: "Science Fiction",
      title: "Last and First Men",
      author: "Olaf Stapledon",
      url:
        "https://www.goodreads.com/book/show/2749148-last-and-first-men?from_search=true&from_srp=true&qid=in3KImOtXo&rank=2",
      isbn: "9780486466828"
    },
    %Book{
      category: "Science Fiction",
      title: "The Gods Themselves",
      author: "Isaac Asimov",
      url:
        "https://www.goodreads.com/book/show/41821.The_Gods_Themselves?ac=1&from_search=true&qid=rOZh4M8O6U&rank=1",
      isbn: "9781857989342"
    },
    %Book{
      category: "Science Fiction",
      title: "Solaris",
      author: "Stanislaw Lem",
      url:
        "https://www.goodreads.com/book/show/95558.Solaris?from_search=true&from_srp=true&qid=jJeseuaDh9&rank=1",
      isbn: "9780156837507"
    },
    %Book{
      category: "Science Fiction",
      title: "Roadside Picnic",
      author: "Arkady & Boris Strugatsky",
      url: "https://www.goodreads.com/book/show/331256.Roadside_Picnic",
      isbn: "9780575070530"
    },
    %Book{
      category: "Science Fiction",
      title: "The Invincible",
      author: "Stanislaw Lem",
      url:
        "https://www.goodreads.com/book/show/251633.The_Invincible?from_search=true&from_srp=true&qid=15kAckSbQn&rank=3",
      isbn: "9780283979620"
    },
    %Book{
      category: "Science Fiction",
      title: "Dispora",
      author: "Greg Egan",
      url:
        "https://www.goodreads.com/book/show/156785.Diaspora?ac=1&from_search=true&qid=E1EThJXSc3&rank=1",
      isbn: "9783453161818"
    },
    %Book{
      category: "Science Fiction",
      title: "The Three-Body Problem Trilogy",
      author: "Cixin Liu",
      url:
        "https://www.goodreads.com/book/show/52073230-three-body-problem-series-3-books-collection-set---the-dark-forest-deat?from_search=true&from_srp=true&qid=mspL9q5CST&rank=9",
      isbn: "9789123663026"
    },
    %Book{
      category: "Science Fiction",
      title: "Rendezvous with Rama",
      author: "Arthur C. Clarke",
      url:
        "https://www.goodreads.com/book/show/112537.Rendezvous_with_Rama?ac=1&from_search=true&qid=BMXnK83th5&rank=1",
      isbn: "9781857231588"
    },
    %Book{
      category: "Science Fiction",
      title: "The Robot Novels (trilogy)",
      author: "Isaac Asimov",
      url:
        "https://www.goodreads.com/book/show/138551.The_Robot_Novels?from_search=true&from_srp=true&qid=ng2AQ4fIJO&rank=3",
      isbn: "9780345331199"
    }
  ]

  def all_books, do: @books
end
