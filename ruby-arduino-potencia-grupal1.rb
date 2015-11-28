require 'artoo'
require 'artoo-arduino'

connection :arduino, :adaptor => :firmata, port: '/dev/cu.usbmodem1411'
device :led, :driver => :led, :pin => 13
device :button, driver: :button, pin: 2

option = -1

# Lets Work!
work do
  # Show Menu to user
  puts "Menu Practica Individual - Electrónica de Potencia 2015"
  puts "1. Start"
  puts "2. Salir"

  # Capture option from the user input
  option = gets.chomp.to_i

  if option == 2
    # Say goodbye to this program dear friend
    puts "Bye, bye!"
    exit
  end

  print "Ingrese el tiempo T1: "
  t1 = gets.chomp.to_i

  print "Ingrese el tiempo T2: "
  t2 = gets.chomp.to_i

  print "Ingrese el tiempo T3: "
  t3 = gets.chomp.to_i

  # Start with led on
  led.on
  puts "Bienvenido a la practica grupal - Electrónica de Potencia 2015"

  # Call button event when signal
  on button, :push => proc { led_pulse(led) }
end

def led_pulse(led)
  led.off
  sleep(1)
  led.on
end