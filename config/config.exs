import Config

config :load_fest_book_club, LoadFestBookClub.Looper,
  every: 1_000,
  tasks: 10

import_config "#{config_env()}.exs"
