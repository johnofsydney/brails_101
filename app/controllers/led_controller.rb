require 'rpi_gpio'

class LedController < ApplicationController
    skip_before_action :verify_authenticity_token

    def on
        RPi::GPIO.set_high 21 # red
        RPi::GPIO.set_high 20 # blue
        RPi::GPIO.set_high 16 # Green

        render json: {led: 'on'}
    end

    def off
        RPi::GPIO.set_low 21
        RPi::GPIO.set_low 20
        RPi::GPIO.set_low 16

        render json: {led: 'off'}
    end
end
