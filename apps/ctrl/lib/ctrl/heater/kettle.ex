defmodule Ctrl.Heater.Kettle do
  @moduledoc "The kettle."
  alias ElixirALE.GPIO
  @behaviour Ctrl.Heater

  @pin 17
  @heater nil
  alias Ctrl.Rpi.Gpio

  def init do
    @heater = GPIO.start_link(@pin, :output)
    {:ok, nil}
  end

  def handle_update(_heater, :heating) do
    GPIO.write(@header, 1)
    :on
  end

  def handle_update(_heater, _mode) do
    GPIO.write(@heater, 0)
    :off
  end

end
