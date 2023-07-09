# brails_101
_BreadboardRails_101_

Runs on Rasberry Pi 400

Firstly to use a bluetooth mouse:

```sh
$ bluetoothctl

[bluetooth]  scan on

# hopefully you will see something like
[NEW] Device 30:D9:XX:XX:E7:27 Johns Own Mouse

# and then then you can 
[bluetoothctl] connect 30:D9:XX:XX:E7:27
```

Secondly, to use the termninal, it needs to run as login 
```sh
$ bash -l
```

This is a Ruby on Rails application 

https://www.rosehosting.com/blog/how-to-install-ruby-on-rails-on-debian-11/



- Rails version is 7.0.3 which was current at time of ding the project (August 2022)
- Ruby version is 2.7, becuase not all requried gems work with later versions.
- There is a SQLite3 database, I think Postgresql needs more memory than available on this device.

2 gems are required to make input and outut work
- rpi_gpio is for manipulation of the pins
- dht-sensor-ffi is for reading data from the temp sensor (different gems / strategies may be required fo reading data from different sensrs)


```rb
gem 'rpi_gpio' # https://www.rubydoc.info/gems/rpi_gpio/0.5.0
gem 'dht-sensor-ffi' # https://github.com/chetan/dht-sensor-ffi
```

At a lower level than the gems, you will need to install a C library to control the pins:
https://raspberry-projects.com/pi/programming-in-c/io-pins/bcm2835-by-mike-mccauley
```sh
  $ curl http://www.airspayce.com/mikem/bcm2835/bcm2835-1.71.tar.gz --output "bcm2835-1.71.tar.gz"
  $ cd bcm2835-1.71/
  $ ./configure
  $ sudo make check
  $ sudo make install
```

`$ budle exec rails server`

## Interactive Use
`/led/on` - turn on all the LEDs
`/led/off` - turn off all the LEDs
(refer to routes)

## Webhooks
Currently set to listen for webhooks
`post 'hook/github'`
simulate with 
```
curl http://127.0.0.1:3000/hook/github -d "payload=true"
```

## Automated
Temperature sensor running on a cron schedule
```sh
$ sudo EDITOR=nano crontab -e
$ service cron restart
$ service cron status
```
Rake task runs every minute, 
reads from the temp sensor
writes the temperature and humidity values as a new record to measurements table
visit http://localhost:3000/measurements for results

## ngrok
top open to outside interaction
```
~/Projects/John/brails_101/ngrok http 3000
```