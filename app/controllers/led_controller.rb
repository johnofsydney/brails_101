require 'rpi_gpio'

class LedController < ApplicationController
    RPi::GPIO.set_numbering :bcm
    RPi::GPIO.setup [16,23,26], :as => :output

    def on
        RPi::GPIO.set_high 23
        RPi::GPIO.set_high 26
        RPi::GPIO.set_high 16

        render json: {led: 'on'}
    end

    def off
        RPi::GPIO.set_low 23
        RPi::GPIO.set_low 26
        RPi::GPIO.set_low 16

        render json: {led: 'off'}
    end
end
