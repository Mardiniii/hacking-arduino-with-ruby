require 'artoo'
require 'artoo-arduino'

connection :arduino, :adaptor => :firmata, port: '/dev/cu.usbmodem1411'
device :led_1, :driver => :led, :pin => 12
device :led_2, :driver => :led, :pin => 13

work do
  puts ""
  print "Número de sumas que desea responder: "
  attempts = gets.chomp
  attempts = attempts.to_i
  count = 0
  points = 0
  while count < attempts do
    sum_1 = Random.rand(9)
    sum_2 = Random.rand(9)
    result = sum_1 + sum_2
    puts ""
    puts "SUMA ##{count+1}"
    print "#{sum_1} + #{sum_2} = "
    answer = gets.chomp
    answer = answer.to_i
    puts ""

    if answer == result
      points+=1
      puts "LA RESPUESTA ES CORECTA"
      led_1.on
      sleep(1)
      led_1.off
    else
      puts "LA RESPUESTA ES INCORRECTA"
      led_2.on
      sleep(1)
      led_2.off
    end
    count+=1
  end
  puts ""
  puts "Puntuación: #{(points*100)/attempts}%"
end