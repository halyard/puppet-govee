# @summary Configure Govee2MQTT instance
#
# @param govee_api_key sets the API key for the Govee API
# @param mqtt_host defines the IP to send/receive MQTT to
# @param ip sets the IP of the mqtt container
class govee (
  String $govee_api_key,
  String $mqtt_host,
  String $ip = '172.17.0.4',
) {
  docker::container { 'mqtt':
    image => 'ghcr.io/wez/govee2mqtt:latest',
    args  => [
      "--ip ${ip}",
      "--env GOVEE_API_KEY=${govee_api_key}",
      "--env GOVEE_MQTT_HOST=${mqtt_host}",
      '--env GOVEE_MQTT_PORT=1883',
      '--env TZ=America/New_York',
    ],
  }
}
