# #####################
# Programming Challenge
# Echo string - Repeat a string and repeat back to the script
# #####################

require 'securerandom'
require 'timeout'

$stdout.sync = true  # Disable stdout caching (for challenges that can be run over the network)

puts 'Prepare yourself. You need to work quickly for this challenge.'
sleep 2
puts 'Echo every second character of the string, starting with the [0]th character, back to me before the script times out. Try writing a script of your own to make it easier!'
sleep 2
puts 'Get ready, here we go...'
sleep 2

# Generate random string
string = [SecureRandom.base64(rand(20..40)), SecureRandom.hex(rand(20..40))].sample
puts string

begin
  Timeout.timeout 5 do
    response = gets.chomp
    char_array = string.split('')
    valid_answer = char_array.select.with_index{|_,i| i.even?}.join
    if response == valid_answer
      puts File.read(flag_path)
    else
      puts 'Incorrect answer!'
      puts 'We were looking for: ' + valid_answer
      exit
    end
  end
rescue Timeout::Error
  puts 'Too slow!'
  exit
end
