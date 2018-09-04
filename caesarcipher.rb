#This is a basic caesar cipher. Only letters [A-Za-z] are affected. I added a decrypt function, but it requires that the user knows the value of the shift to perform the decryption.

class CaesarCipher
  @@uppercase = *("A".."Z")
  @@lowercase = *("a".."z")

  attr :string, :shift

  def initialize(string, shift=1)
    @string = string
    @shift = shift
  end

  def encrypt
    encryptors
    string.chars.map { |char|
      if @@uppercase.include? char
        @uppercase_encryptor.fetch(char)
      elsif @@lowercase.include? char
        @lowercase_encryptor.fetch(char)
      else char
      end }.join
  end

  def decrypt
    decryptors
    string.chars.map { |char|
      if @@uppercase.include? char
        @uppercase_decryptor.fetch(char)
      elsif @@lowercase.include? char
        @lowercase_decryptor.fetch(char)
      else char
      end }.join
  end

  private

  def encryptors
    @uppercase_encryptor = Hash[@@uppercase.zip(@@uppercase.rotate(shift))]
    @lowercase_encryptor = Hash[@@lowercase.zip(@@lowercase.rotate(shift))]
  end

  def decryptors
    @uppercase_decryptor = Hash[@@uppercase.zip(@@uppercase.rotate(-shift))]
    @lowercase_decryptor = Hash[@@lowercase.zip(@@lowercase.rotate(-shift))]
  end

end

cipher1 = CaesarCipher.new("Pmttw! Ug vium qa Rwmt.", 8)
p cipher1.decrypt
