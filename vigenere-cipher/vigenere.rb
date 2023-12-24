# frozen_string_literal: true
require_relative 'char_manipulator'

# class to encrypt and decrypt text using vigenere cipher
class Vigenere < CharManipulator
  attr_accessor :text, :key

  def initialize
    super
    @text = ''
    @key = ''
  end

  def normalize_key(key)
    normalized_key = ''
    @text.length.times do |i|
      normalized_key += key[i % key.length]
    end
    normalized_key
  end

  def encrypt
    encrypted_text = ''
    @text = @text.upcase
    @key = normalize_key(@key).upcase
    @text.length.times do |i|
      encrypted_text += encrypt_char(@text[i], @key[i])
    end
    encrypted_text
  end

  def decrypt
    decrypted_text = ''
    @text = @text.upcase
    @key = normalize_key(@key).upcase
    @text.length.times do |i|
      decrypted_text += decrypt_char(@text[i], @key[i])
    end
    decrypted_text
  end
end
