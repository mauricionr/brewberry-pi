use Mix.Config

import_config "#{Mix.env}.exs"

config :ctrl,
  brew_house: [power: 1000, efficiency: 0.80, volume: 20, wait_time: 20]
