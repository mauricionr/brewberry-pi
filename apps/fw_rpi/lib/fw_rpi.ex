defmodule FwRpi do
  @moduledoc """
  Set up Raspberry Pi networking.
  """
  use Application

  alias Nerves.Networking

  @wlan_interface "wlan0"
  @wlan_ssid Application.get_env(:fw_rpi, :ssid)
  @wlan_key_mgmt Application.get_env(:fw_rpi, :key_mgmt)
  @wlan_psk Application.get_env(:fw_rpi, :psk)

  def start(_type, _args) do
    # start_wifi()
    start_eth()#while using rpi1
    network_time()
    :dnssd.register("Brewberry π", "_http._tcp", 80)
    {:ok, self()}
  end

  @spec start_wifi() :: :ok
  def start_wifi do
    Nerves.Network.setup @wlan_interface,
      ssid: @wlan_ssid,
      key_mgmt: @wlan_key_mgmt,
      psk: @wlan_psk
  end

  @spec start_eth() :: :ok
  def start_eth do
    # Configure a network that supplies IP addresses via DHCP
    Nerves.Network.setup "eth0", ipv4_address_method: :dhcp
  end

  def network_time do
    {_, 0} = System.cmd("/usr/sbin/ntpd", ["-g"])
    :ok
  end

#  @dialyzer {:nowarn_function, start_network: 0}
#  @dialyzer {:nowarn_function, start: 2}
end
