require 'rpi_gpio'

class HookReceiverController < ApplicationController
  RPi::GPIO.set_numbering :bcm
  RPi::GPIO.setup [16,23,26], :as => :output

  skip_before_action :verify_authenticity_token

  def animal
    # receiving webhooks from animal crossing
    puts JSON.parse(params["payload"])
    flash(0.05)

    render json: { webhook: 'push_to_animal_crossing' }
  end


  def flash(sleep_time)
    10.times do
      [16,23,26].each do |pin|
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
# curl http://127.0.0.1:3000/hook/animal -d "payload=true"
# ```