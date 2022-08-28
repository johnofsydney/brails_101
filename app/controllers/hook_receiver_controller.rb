require 'rpi_gpio'

class HookReceiverController < ApplicationController
  skip_before_action :verify_authenticity_token

  def animal
    # receiving webhooks from animal crossing
    puts '**********************'
    puts '**********************'
    puts JSON.parse(request)
    puts '**********************'
    puts '**********************'
  end
end
