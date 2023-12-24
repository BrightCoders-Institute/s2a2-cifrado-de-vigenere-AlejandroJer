# frozen_string_literal: true

# class to manipulate each character of the text to encrypt or decrypt
class CharManipulator
  attr_accessor :alphabet

  def initialize
    @alphabet = %w[A B C D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z]
  end

  def encrypt_char(char, key_char)
    return char unless @alphabet.include?(char)

    char_index = @alphabet.index(char)
    key_index = @alphabet.index(key_char)
    encrypted_index = (char_index + key_index) % @alphabet.length
    @alphabet[encrypted_index]
  end

  def decrypt_char(char, key_char)
    return char unless @alphabet.include?(char)

    char_index = @alphabet.index(char)
    key_index = @alphabet.index(key_char)
    decrypted_index = (char_index - key_index) % @alphabet.length
    @alphabet[decrypted_index]
  end
end
