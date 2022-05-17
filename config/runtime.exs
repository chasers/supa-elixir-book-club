import Config

config :load_fest_book_club, LoadFestBookClub.Looper,
  max_concurrency: String.to_integer(System.get_env("MAX_CONCURRENCY") || "1")
  every: String.to_integer(System.get_env("EVERY") || "1000")
