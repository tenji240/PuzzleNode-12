class P12
  ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  def self.rotate(example_array, num = 1)
    num.times do
      example_array.push(example_array.shift)
    end

    example_array
  end

  def self.get_alphabet(shift = 0)
    alphabet_array = ALPHABET.split("")
    new_alphabet = rotate(alphabet_array, shift).join

    return new_alphabet
  end

  def self.decrypt_word(encrypted_word, cypher_alphabet)
    new_word = []
    ca_array = cypher_alphabet.split("")
    encrypted_word.split("").each do |letter|
      position = ca_array.index(letter)
      new_word << get_alphabet[position]
    end

    return new_word.join
  end

  def self.get_caesar_options(cypher)

  end
end