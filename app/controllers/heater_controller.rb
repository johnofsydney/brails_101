class HeaterController < ApplicationController
    skip_before_action :verify_authenticity_token

    def on
        RPi::GPIO.set_high 19
        render json: {heater: 'on'}
    end

    def off
        RPi::GPIO.set_low 19
        render json: {heater: 'off'}
    end
end
