import Config

config :load_fest_book_club, LoadFestBookClub.Looper,
  stream_len: 1,
  max_concurrency: 1,
  every: 1_000

import_config "#{config_env()}.exs"
