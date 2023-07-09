require 'rpi_gpio'
RPi::GPIO.set_numbering :bcm
RPi::GPIO.setup [16,20,21, 19, 13], :as => :output

Rails.logger.info "\n\ninitialized the pins"


RPi::GPIO.set_low 21
RPi::GPIO.set_low 20
RPi::GPIO.set_low 16 # green
RPi::GPIO.set_low 19 # heater relay
RPi::GPIO.set_low 13 # lamp relay