require 'rpi_gpio'

class HookReceiverController < ApplicationController
  OUTPUT_PINS = [16, 20, 21]
  skip_before_action :verify_authenticity_token

  def github
    # receiving webhooks
    Rails.logger.info params

    flash(0.05)

    render json: { webhook: 'push received' }
  end


  def flash(sleep_time)
    10.times do
      OUTPUT_PINS.each do |pin|
        on(pin)
        sleep(sleep_time)
        off(pin)
        sleep(sleep_time)
      end
    end
  end

  def on(pin)
    RPi::GPIO.set_high(pin)
  end

  def off(pin)
    RPi::GPIO.set_low(pin)
  end
end
# this works to test on local
# ```
# $ curl http://127.0.0.1:3000/hook/github -d "payload=true"
# ```

# to start ngrok
# ngrok http 3000