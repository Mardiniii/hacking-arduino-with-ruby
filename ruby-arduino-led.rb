require 'artoo'
require 'artoo-arduino'

connection :arduino, :adaptor => :firmata, port: '/dev/cu.usbmodem1411'
device :led_2, :driver => :led, :pin => 12
device :led_1, :driver => :led, :pin => 13

work do
  while led_status != 3 do
    puts "****************** MENU ******************"
    puts "1. Encender el LED"
    puts "2. Apagar el LED"
    led_status = gets.chomp
    if led_status == "2"
      led_1.off
      led_2.off
      puts "LED Apagado"
    elsif led_status == "1"
      led_1.on
      led_2.on
      puts "LED Encendido"
    end
  end
end