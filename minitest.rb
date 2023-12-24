# frozen_string_literal: true
require 'minitest/autorun'
require_relative './vigenere-cipher/vigenere'

# class to test vigenere cipher with miniTest
class TestVigenere < Minitest::Test
  def test_encrypt_char
    v = Vigenere.new
    assert_equal 'Z', v.encrypt_char('H', 'S')
  end

  def test_decrypt_char
    v = Vigenere.new
    assert_equal 'R', v.decrypt_char('T', 'C')
  end

  def test_normalize_key
    v = Vigenere.new
    v.text = 'HOLA'
    assert_equal 'SECR', v.normalize_key('SECRETO')
  end

  def test_encrypt
    v = Vigenere.new
    v.text = 'HOLA' # message to encrypt
    v.key = 'SECRETO' # key to encrypt
    assert_equal 'ZSNR', v.encrypt
  end

  def test_decrypt
    v = Vigenere.new
    v.text = 'TJEA' # message to decrypt
    v.key = 'COD' # key to decrypt
    assert_equal 'RUBY', v.decrypt
  end
end
