import Config

config :load_fest_book_club, :poller,
  every: 1_000,
  url: "https://book-club.fly.dev/repos/7/requests/new",
  tasks: 10
