import Config

config :load_fest_book_club, LoadFestBookClub.Looper, stream_len: 1000

import_config "#{config_env()}.exs"
