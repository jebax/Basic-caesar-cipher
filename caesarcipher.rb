class CaesarCipher

  attr :string, :shift

  def initialize(string, shift=1)
    @string = string
    @shift = shift
    @uppercase = *("A".."Z")
    @lowercase = *("a".."z")
  end

  def encrypt
    load_encryptors
    string.chars.map do |char|
      if @uppercase.include? char
        @uppercase_encryptor.fetch(char)
      elsif @lowercase.include? char
        @lowercase_encryptor.fetch(char)
      else
        char
      end
    end
    .join
  end

  def decrypt
    load_decryptors
    string.chars.map do |char|
      if @uppercase.include? char
        @uppercase_decryptor.fetch(char)
      elsif @lowercase.include? char
        @lowercase_decryptor.fetch(char)
      else
        char
      end
    end
    .join
  end

  def load_encryptors
    @uppercase_encryptor = Hash[@uppercase.zip(@uppercase.rotate(shift))]
    @lowercase_encryptor = Hash[@lowercase.zip(@lowercase.rotate(shift))]
  end

  def load_decryptors
    @uppercase_decryptor = Hash[@uppercase.zip(@uppercase.rotate(-shift))]
    @lowercase_decryptor = Hash[@lowercase.zip(@lowercase.rotate(-shift))]
  end

  private :load_encryptors, :load_decryptors

end
