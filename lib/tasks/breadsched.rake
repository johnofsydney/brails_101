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


# Edit this file to introduce tasks to be run by cron.
# 
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
# 
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').
# 
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
# 
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
# 
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
# 
# For more information see the manual pages of crontab(5) and cron(8)
# 
# m h  dom mon dow   commandon


# * * * * * /bin/bash -l -c 'echo starting-cron-minutely && cd ~/Projects/John/brails_101 && bundle exec rake schedule'