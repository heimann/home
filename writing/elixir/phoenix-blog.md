===title===
Creating a Blog with Phoenix

===description===
A step-by-step guide to creating a blog with Elixir and Phoenix

===tags===
tutorial, elixir, phoenix

===date===
2020-05-11

===body===
I've gone through the motions of making a static site website. My first
attempt was a [Gatsbyjs](https://gatsbyjs.org) site on
[Netlify](https://netlify.com). I love both of those but I quickly got bored
with all the javascript :)

After that, I made a static site that looks much like the one you're on right
now with [Hugo](https://gohugo.io). Hugo was fast, and Go is fun but to be
honest I liked the Gatsby experience way more. Ultimately, I wanted to do
something different.

I've been enamored by [elixir](https://elixir-lang.org) and
[phoenix](https://phoenixframework.org) for a while now and so when José Valim
wrote up [a post on Dashbit's new
blog](https://dashbit.co/blog/welcome-to-our-blog-how-it-was-made) I knew I had
to try something similar.

Fair warning, this was very much inspired by both José and
[Saša Jurić's site](https://github.com/sasa1977/erlangelist), you'll
most likely learn a lot more by reading their posts and source code than reading
this.

Nonetheless, I wanted to put this together as an exercise and to show that
Phoenix and Elixir, without a database, is a viable choice for a blog.

### Getting Started
First, if you haven't installed Elixir yet head to [the installation
instructions](https://elixir-lang.org/install.html) and do that first.

Now, open up a terminal and follow along :)

We're going to start by making sure we have Phoenix installed:
(1.5.1 is the newest version as of this, but go with the latest and greatest)
```bash
$ mix archive.install hex phx_new
```

Now, let's create a new Phoenix project without ecto (since we won't be needing
a database)
```bash
$ mix phx.new example_site --no-ecto
```

This command uses
[mix](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html)
to invoke the `phx_new` application we just installed, creating a new phoenix
application named **example_site**.

When prompted to `Fetch and install dependencies?` press `Y`

Let's go into the directory and get to coding.
```bash
$ cd example_site
```

### Blog Posts

The first thing we're going to need is a way to represent our Blog posts as an
Elixir [struct](https://elixir-lang.org/getting-started/structs.html). Structs
are one of the most important types of data structure in elixir and one you'll
use a lot. In our case, we need a way to go from a markdown file to a struct
that elixir can understand.

Before we get there, let's talk a little bit about structure. Elixir
applications tend to follow the same type of structure, with a top level
directory that holds some files about the program itself (like `mix.exs` and
`README.md`). The most important folder here tends to be the `lib` folder
where our application lives.

If you go into our lib folder you'll see two folders:
```bash
$ cd lib
$ ls
example_site/ example_site.ex example_site_web/ example_site_web.ex
```

The most important thing to note here is the division between `example_site/` and
`example_site_web/`. Elixir programmers like to use this concept of contexts to manage
their code and Phoenix is no different. You typically put your contexts into
your `app/` folder, in our case `example_site/` and leave `example_site_web/`
for things that are specifically related to the web application portion.

To summarize:
* `example_site/` <- Your elixir application
* `example_site_web/` <- Your phoenix application

Let's go into `example_site/` and add the modules that will be responsible for our
blog and blog posts.
```bash
$ cd examlpe_site/
$ touch blog.ex
$ mkdir blog
$ touch blog/post.ex
```

In this case, `lib/example_site/blog.ex` will be our context and
`lib/example_site/blog/post.ex` our Post module. Let's start by creating our
`Post` model. Open up `post.ex` in your favorite editor and let's build this
up step by step.

_If you want to see the completed file, you can search for `post.ex` and scroll
past all the gifs to see the final version. I have way too much fun making
these gifs so I'm going to explain it bit by bit :)_

The first thing we're going to do is to define our struct using the `defstruct`
macro. We're also going to use @enforce_keys to ensure that all keys are present
when we try to create a new struct. As a shorthand we're just passing the
enforced keys straight into `defstruct` since we want all of our keys present.

<video controls style="width: 95% margin: 0 auto;">
  <source src="../images/blog1.mp4" type="video/mp4">
</video>

Now, we're going to build up the rest of the file by starting from the end of
our processing pipeline. We're going to eventually have a function called
`parse!/1` that takes a filename, parses the contents and returns our `%Post{}`
struct.

That flow will look like this, in semi-pseudo code (hopefully this makes sense):

File -> parse() -> parse_contents(File.read) -> parse_content_part()

In Elixir, as with many functional languages it makes sense to start at the end
of that flow. If we wrote our `parse!/1` function now, our compiler would get
angry since we'll try to call a non-existent `parse_contents/1` function etc...

So, let's parse our content blocks. Our markdown files will look something like
this:
```markdown
==title==
Awesome Blogpost

==description==
The best blog post there ever was

==tags==
old_news, science

==date==
2020-05-11

==body==

## Here comes the markdown!
Look at me, I'm a [link](https://exercism.io).

```

The first thing we need to do is take those sections `==title==` etc, and their
content `Awesome Blogpost` and transform them to our elixir struct:

```elixir
%{
  title: "Awesome Blogpost"
  ...
}
```

For each `section`, we'll have a function that parses that attr that takes
an atom (the attr), and it's value. Like so:

<video controls style="width: 95% margin: 0 auto;">
  <source src="../images/blog2.mp4" type="video/mp4">
</video>

That takes care of most of the sections, but notice that we left out `body`.
The `body` is a little special since we need to parse the markdown syntax within
and output html. Time to add some depenencies. And while we're at it, we might
as well add another dependency we're going to use later to generate Slugs.

Open up `mix.exs` at the root of your project and add
[earmark](https://github.com/pragdave/earmark)and
[slugify](https://github.com/jayjun/slugify) to your dependencies:
```elixir
...
  defp deps do
    [
      {:phoenix, "~> 1.5.1"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_dashboard, "~> 0.2.0"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      # Markdown Support
      {:earmark, "~> 1.3"},
      # To Generate Slugs
      {:slugify, "~> 1.3.0"}
    ]
  end
...
```

Now, back in our terminal let's download our dependencies and compile the
application:
```bash
$ mix do deps.get, deps.compile
$ mix phx.server
```

Ok, let's open up `lib/example_site/blog/post.ex` again and add the parsing
function for our `body`. Note that we add it above the function we just added
so Elixir can do it's pattern matching magic.

<video controls style="width: 95% margin: 0 auto;">
  <source src="../images/blog3.mp4" type="video/mp4">
</video>

We're getting closer! Time to put these functions into use:

<video controls style="width: 95% margin: 0 auto;">
  <source src="../images/blog4.mp4" type="video/mp4">
</video>

That's a good amount of code all at once, let's break it down a little. We take
the entire contents of a file, split it up into it's distinct parts with that
regex, and then using a [for comprehension](https://elixir-lang.org/getting-started/comprehensions.html) 
we parse that specific attribute according to it's rules (using the functions 
we wrote just before this).

Now, let's write the final function in this file, the one that actually parses
a file given it's filename and puts it all together.

<video controls style="width: 95% margin: 0 auto;">
  <source src="../images/blog5.mp4" type="video/mp4">
</video>

That's it! Our final `lib/example_site/blog/post.ex`:
```elixir
defmodule ExampleSite.Blog.Post do
  @enforce_keys [:title, :slug, :body, :description, :tags, :date]
  defstruct @enforce_keys

  def parse!(filename) do
    contents = parse_contents(File.read!(filename))

    slug =
      Keyword.get(contents, :title)
      |> Slug.slugify()

    struct!(__MODULE__, contents ++ [slug: slug])
  end

  defp parse_contents(contents) do
    parts =
      Regex.split(~r/^==(\w+)==\n/m, contents,
        include_captures: true,
        trim: true
      )

    for [attr_with_equals, value] <- Enum.chunk_every(parts, 2) do
      [_, attr, _] = String.split(attr_with_equals, "==")
      attr = String.to_atom(attr)
      {attr, parse_attr(attr, value)}
    end
  end

  defp parse_attr(:body, value),
    do:
      value
      |> Earmark.as_html!(%Earmark.Options{
        smartypants: false,
        code_class_prefix: "language-"
      })

  defp parse_attr(attr, value)
       when attr in [:title, :description, :tags, :date],
       do: String.trim(value)
end
```

### Our Blog Context

It's worth taking a breath here and taking stock of what we have. While we're
pretty far away from our finished blog, we have a working model of what our 
`Post`s will look like, and that's a great start. Philosophically, we're
taking the approach of building up the application first here, meaning the
functionality of it all, and then adding form (styling etc later).

#### A Context

The job of our `Blog` context is going to be to create the main API our web
application interfaces with when grabbing our posts to display them to our
visitors. It's going to have a couple of important functions, the most prominent
being `all_posts` and `get_post_by_slug/1` which we'll use to grab a specific
blog post when a visitor navigates to `/posts/:slug`.

Oh, one more thing. Our actual posts are going to live in a folder called `blog`
at the root of our project. Let's make that now.

```bash
$ ls
_build/ config/ lib/ mix.lock README.md
assets/ deps/ mix.exs priv/ test/
$ mkdir blog
$ touch blog/our_first_post.md
$ touch blog/example_site/blog.ex
```

Open up `blog/our_first_post.md` and add the following content:

```markdown
==title==
Our first post!

==description==
Our very first blog post. Look at us!!

==tags==
learning, fun, awesomeness, cheesy_tags

==date==
2020-05-11

==body==
## A Post
There once was a post that knew a tree, the tree said to the post, what's
cracking post? And the post said: nothing, I'm made of steel.
```

Ok now that we have that, let's venture into our `Blog` context. First of all,
let's make sure our dependent application is started and then locate our posts.
Open up `lib/example_site/blog.ex`:

<video controls style="width: 95% margin: 0 auto;">
  <source src="../images/blog6.mp4" type="video/mp4">
</video>

We have something here! I like to get something tangible as quickly as possible
when I write code, it helps me verify that what I have is working and build up
a better mental model of the code in my head. For that reason, let's take this 
for a spin in elixir's interactive repl:

<video controls style="width: 95% margin: 0 auto;">
  <source src="../images/blog7.mp4" type="video/mp4">
</video>

That's our post! Shit like this gets me so excited everytime. Ok let's try to 
give that post to our `parse!/1` function!

<video controls style="width: 95% margin: 0 auto;">
  <source src="../images/blog8.mp4" type="video/mp4">
</video>

It's alive!!

Now let's build up our context api, `all_posts`, and `get_post_by_slug`:

<video controls style="width: 95% margin: 0 auto;">
  <source src="../images/blog9.mp4" type="video/mp4">
</video>

Once again, let's test it out in iex!

<video controls style="width: 95% margin: 0 auto;">
  <source src="../images/blog10.mp4" type="video/mp4">
</video>

Here's our finished `lib/example_site/blog.ex`:
```elixir
defmodule ExampleSite.Blog do
  alias ExampleSite.Blog.Post

  Application.ensure_all_started(:earmark)

  posts_paths = "blog/**/*.md" |> Path.wildcard() |> Enum.sort()

  posts =
    for post_path <- posts_paths do
      @external_resource Path.relative_to_cwd(post_path)
      Post.parse!(post_path)
    end

  @posts posts

  def all_posts do
    @posts
  end

  def get_post_by_slug(slug) do
    all_posts()
    |> Enum.find(&(&1.slug == slug))
  end
end
```

Ok that's basically it for the creating a blog part, but it would be no fun if
we stopped here so let's make this an actual blog with links and a frontpage :)

... wip
