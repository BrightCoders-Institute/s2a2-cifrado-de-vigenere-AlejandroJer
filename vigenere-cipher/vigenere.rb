class Vigenere
  attr_accessor :key, :text, :encrypted_text, :decrypted_text, :alphabet

  def initialize
    @alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'ñ', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
  end

  def setAlphabet(array)
    @alphabet = array
  end

  def SetText(string)
    @text = string
  end

  def SetKey(string)
    @key = normalize_key(string)
  end

  def GetText
    @text
  end

  def GetKey
    @key
  end

  def GetEncryptedText
    @encrypted_text
  end

  def GetDecryptedText
    @decrypted_text
  end

  def GetAlphabet
    @alphabet
  end

  def encrypt_char(char, key_char)
    if char == ' '
      return ' '
    end
    char_index = @alphabet.index(char)
    key_index = @alphabet.index(key_char)
    encrypted_index = (char_index + key_index) % @alphabet.length
    @alphabet[encrypted_index]
  end

  def decrypt_char(char, key_char)
    if char == ' '
      return ' '
    end
    char_index = @alphabet.index(char)
    key_index = @alphabet.index(key_char)
    decrypted_index = (char_index - key_index) % @alphabet.length
    @alphabet[decrypted_index]
  end

  def normalize_key(key)
      normalized_key = ''
      @text.length.times do |i|
        normalized_key += key[i % key.length]
      end
      normalized_key
  end

  def Encrypt
    @encrypted_text = ''
    @text.length.times do |i|
      @encrypted_text += encrypt_char(@text[i].downcase, @key[i].downcase)
    end
    @encrypted_text
  end

  def Decrypt
    @decrypted_text = ''
    @text.length.times do |i|
      @decrypted_text += decrypt_char(@text[i].downcase, @key[i].downcase)
    end
    @decrypted_text
  end
end
