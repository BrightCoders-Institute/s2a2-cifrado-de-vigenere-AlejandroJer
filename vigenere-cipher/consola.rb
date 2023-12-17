require_relative 'vigenere.rb'


v = Vigenere.new

while true
  system('clear')
  print "MENU\n"
  print "1. Encrypt\n"
  print "2. Decrypt\n"
  print "3. Exit\n"

  option = gets.chomp.to_i

  case option
  when 1
    print "Enter the text to encrypt: \n"
    v.SetText(gets.chomp)
    print "Enter the key: \n"
    v.SetKey(gets.chomp)
    print "Encrypted text: #{v.Encrypt}"
    wait = gets.chomp
  when 2
    print "Enter the text to decrypt: \n"
    v.SetText(gets.chomp)
    print "Enter the key: \n"
    v.SetKey(gets.chomp)
    print "Decrypted text: #{v.Decrypt}"
    wait = gets.chomp
  when 3
    break
  else
    puts 'Invalid option'
  end
end
