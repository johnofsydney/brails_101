desc "Run relay on a schedule"

require 'rpi_gpio'

task :schedule do
    RPi::GPIO.set_numbering :bcm
    RPi::GPIO.setup [16], :as => :output

    response = { temperature: 15 }

    if response[:temperature] < 14
        puts "rake: setting high"
        RPi::GPIO.set_high 16
    else
        puts "rake: setting low"
        RPi:GPIO.set_low 16
    end

end