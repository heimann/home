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
      category: "Interesting People & Companies",
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
    },
    %Book{
      category: "Interesting People & Companies",
      title: "Leonardo: The First Scientist",
      author: "Michael White",
      url:
        "https://www.goodreads.com/book/show/196061.Leonardo?from_search=true&from_srp=true&qid=QSDOVlvP3Z&rank=1",
      isbn: "9780349112749"
    },
    %Book{
      category: "Interesting People & Companies",
      title: "Richard Feynman: A Life in Science",
      author: "John & Mary Gribbin",
      url:
        "https://www.goodreads.com/book/show/56165.Richard_Feynman?ac=1&from_search=true&qid=wvWOYbY6OU&rank=2",
      isbn: "9780452276314"
    },
    %Book{
      category: "Interesting People & Companies",
      title: "Einstein: A Life in Science",
      author: "Michael White & John Gribbin",
      url:
        "https://www.goodreads.com/book/show/755121.Einstein?ac=1&from_search=true&qid=rroaRfUYRo&rank=1",
      isbn: "9780743263894"
    },
    %Book{
      category: "Interesting People & Companies",
      title: "Becoming Steve Jobs",
      author: "Brent Schlender",
      url:
        "https://www.goodreads.com/book/show/22318382-becoming-steve-jobs?from_search=true&from_srp=true&qid=Tc607Bedaq&rank=1",
      isbn: "9780385347402"
    },
    %Book{
      category: "Interesting People & Companies",
      title: "The Everything Store: Jeff Bezos and the Age of Amazon",
      author: "Brad Stone",
      url: "https://www.goodreads.com/book/show/17660462-the-everything-store",
      isbn: "9780316219266"
    },
    %Book{
      category: "Interesting People & Companies",
      title: "Sam Walton: Made in America",
      author: "Sam Walton & John Huey",
      url:
        "https://www.goodreads.com/book/show/10631.Sam_Walton?ac=1&from_search=true&qid=v5FaK4hOYd&rank=1",
      isbn: "9780553562835"
    },
    %Book{
      category: "Interesting People & Companies",
      title: "Madame Curie: A Biography",
      author: "Eve Curie",
      url:
        "https://www.goodreads.com/book/show/341166.Madame_Curie?ac=1&from_search=true&qid=5PFXWVbhCb&rank=1",
      isbn: "9780306810381"
    },
    %Book{
      category: "Interesting People & Companies",
      title: "Alvarez",
      author: "Luis W. Alvarez",
      url:
        "https://www.goodreads.com/book/show/3226232-alvarez?from_search=true&from_srp=true&qid=Earfr0xn7a&rank=10",
      isbn: "9780465001156"
    },
    %Book{
      category: "Hobbies",
      title: "Stick and Rudder: An Explanation of the Art of Flying",
      author: "Wolfgang Langewiesche",
      url:
        "https://www.goodreads.com/book/show/680115.Stick_and_Rudder?from_search=true&from_srp=true&qid=TYSTcVrwyw&rank=1",
      isbn: "9780070362406"
    },
    %Book{
      category: "Fiction",
      title: "The Master and Margharita",
      author: "Mikhail Bulgakov",
      url:
        "https://www.goodreads.com/book/show/117833.The_Master_and_Margarita?from_search=true&from_srp=true&qid=swPeqZqvth&rank=1",
      isbn: "9780679760801"
    },
    %Book{
      category: "Fiction",
      title: "Crime and Punishment",
      author: "Fyodor Dostoyevsky",
      url: "https://www.goodreads.com/book/show/7144.Crime_and_Punishment",
      isbn: "9780143058144"
    },
    %Book{
      category: "Fiction",
      title: "The Metamorphosis",
      author: "Franz Kafka",
      url: "https://www.goodreads.com/book/show/485894.The_Metamorphosis",
      isbn: "9789871165070"
    },
    %Book{
      category: "Fiction",
      title: "Siddharta",
      author: "Herman Hesse",
      url:
        "https://www.goodreads.com/book/show/52036.Siddhartha?ac=1&from_search=true&qid=JWq9cbypBU&rank=1",
      isbn: "9789502531328"
    },
    %Book{
      category: "Fiction",
      title: "The Magician of Lublin",
      author: "Isaac Bashevis Singer",
      url:
        "https://www.goodreads.com/book/show/940167.The_Magician_of_Lublin?ac=1&from_search=true&qid=snwIbNPXzK&rank=1",
      isbn: "9780140048070"
    },
    %Book{
      category: "Fiction",
      title: "Zen and the Art of Motorcycle Maintenance",
      author: "Robert M. Pirsig",
      url:
        "https://www.goodreads.com/book/show/629.Zen_and_the_Art_of_Motorcycle_Maintenance?ac=1&from_search=true&qid=GoXKDGCQT5&rank=1",
      isbn: "9780060589462"
    },
    %Book{
      category: "Graphic Novels",
      title: "Uncle Scrooge and Donald Duck: The Son of the Sun",
      author: "Don Rosa",
      url:
        "https://www.goodreads.com/book/show/18444220-uncle-scrooge-and-donald-duck?from_search=true&from_srp=true&qid=nZhE60SPAZ&rank=2",
      isbn: "9781606997420"
    },
    %Book{
      category: "Graphic Novels",
      title: "Watchmen",
      author: "Alan Moore",
      url:
        "https://www.goodreads.com/book/show/472331.Watchmen?from_search=true&from_srp=true&qid=Hku7x9fVjj&rank=2",
      isbn: "9780930289232"
    },
    %Book{
      category: "Graphic Novels",
      title: "Maus",
      author: "Art Spiegelman",
      url: "https://www.goodreads.com/book/show/15195.The_Complete_Maus",
      isbn: "9780141014081"
    },
    %Book{
      category: "Graphic Novels",
      title: "Persepolis",
      author: "Marjane Satrapi",
      url: "https://www.goodreads.com/book/show/991197.The_Complete_Persepolis",
      isbn: "9780375714832"
    },
    %Book{
      category: "Science Fiction",
      title: "The Left Hand of Darkness",
      author: "Ursula K. Le Guin",
      url:
        "https://www.goodreads.com/book/show/18423.The_Left_Hand_of_Darkness",
      isbn: "9780060125745"
    }
  ]

  def all_books, do: @books
end
