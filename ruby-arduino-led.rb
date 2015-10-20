require 'artoo'
require 'artoo-arduino'

connection :arduino, :adaptor => :firmata, port: '/dev/cu.usbmodem1411'
device :led, :driver => :led, :pin => 13

work do
  while led_status != 3 do
    puts "****************** MENU ******************"
    puts "1. Encender el LED"
    puts "2. Apagar el LED"
    led_status = gets.chomp
    if led_status == "2"
      led.off
      puts "LED Apagado"
    elsif led_status == "1"
      led.on
      puts "LED Encendido"
    end
  end
end