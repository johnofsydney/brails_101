require 'rpi_gpio'

class HookReceiverController < ApplicationController

  def animal
    # receiving webhooks from animal crossing
    puts request.inspect
    puts request.to_h
    puts request.to_json
  end
end
