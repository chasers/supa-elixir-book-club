import Config

config :load_fest_book_club, LoadFestBookClub.Looper,
  stream_len: 1_000,
  max_concurrency: 10,
  every: 0

import_config "#{config_env()}.exs"
