class LampController < ApplicationController
    skip_before_action :verify_authenticity_token


    def toggle
        relay_pin = 13
        relay_on = RPi::GPIO.high? relay_pin

        if relay_on
            RPi::GPIO.set_low relay_pin
            relay_on = !relay_on
        else
            RPi::GPIO.set_high relay_pin
            relay_on = !relay_on
        end

        render json: {relay_on: relay_on}
    end
end
