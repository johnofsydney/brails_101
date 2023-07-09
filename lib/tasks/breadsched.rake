desc "Run relay on a schedule"

require 'rpi_gpio'
require 'rest-client'
require 'dht-sensor-ffi'

task :schedule do
    # gather temperature and humidity
    val = DhtSensor.read(26, 11)
    temperature = val.temp
    humidity = val.humidity

    url = 'http://localhost:3000/measurements'
    params = {
        measurement: {
            temperature: temperature,
            humidity: humidity
        }
    }
    RestClient.post(url, params, headers={})   

    TURN_ON_TEMP = 15
    # Control the heater
    if temperature < TURN_ON_TEMP
        RestClient.get('http://localhost:3000/heater/on')
    else
        RestClient.get('http://localhost:3000/heater/off')
    end
end