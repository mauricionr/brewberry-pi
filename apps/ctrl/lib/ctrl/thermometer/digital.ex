defmodule Ctrl.Thermometer.Digital do
  @moduledoc "DS18B20 thermometer, mounted on pin 17."
  @behaviour Ctrl.Thermometer

  alias ElixirALE.GPIO

  def init, do: {:ok, GPIO.read}

  def handle_read(sensor), do: GPIO.read(sensor)

end
