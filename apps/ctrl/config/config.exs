use Mix.Config

import_config "#{Mix.env}.exs"

config :ctrl,
  brew_house: [power: 1000, efficiency: 0.80, volume: 11, wait_time: 20]
