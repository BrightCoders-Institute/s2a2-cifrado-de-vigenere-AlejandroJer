# frozen_string_literal: true

require_relative './vigenere-cipher/vigenere'

def prompt_inputs(obj)
  puts 'Enter the text to encrypt:'
  obj.text = gets.chomp
  puts 'Enter the key:'
  obj.key = gets.chomp
end

def wait_enter
  print 'Press enter to continue...'
  gets.chomp
end

v = Vigenere.new

loop do
  system('clear')
  print "MENU\n1. Encrypt text\n2. Decrypt text\n3. Exit\n\nEnter an option: "

  option = gets.chomp.to_i

  case option
  when 1
    prompt_inputs(v)
    puts "Encrypted text: #{v.encrypt}"
    wait_enter
  when 2
    prompt_inputs(v)
    puts "Decrypted text: #{v.decrypt}"
    wait_enter
  when 3
    break
  end
end
