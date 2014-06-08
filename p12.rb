class P12
  #Base Alphabet used for Decryption

  ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  DICTIONARY = []
  File.open("en.txt") do |file|
    file.each do |line|
      DICTIONARY << line.strip.upcase
    end
  end
  

  #Performs the Rotation of an array by the shift amount
  def self.rotate(example_array, num = 1)
    num.times do
      example_array.push(example_array.shift)
    end

    example_array
  end

  #Performs the Alphabet Rotation
    #takes the standard alphabet and rotates it until it is 
    #the cypher Alphabet we need
  def self.get_alphabet(shift = 0)
    alphabet_array = ALPHABET.split("")
    new_alphabet = rotate(alphabet_array, shift).join

    return new_alphabet
  end

  #Performs the Word decryption based on the passed Cypher Alphabet
    #takes in the cypher alphabet and the word
    #splits the word and the ca to arrays
    #determines the location of the encrypted letter and returns
    #the correct letter
  def self.decrypt_word(encrypted_word, cypher_alphabet)
    new_word = []
    ca_array = cypher_alphabet.split("")
    encrypted_word.split("").each do |letter|
      position = ca_array.index(letter)
      new_word << get_alphabet[position]
    end

    return new_word.join
  end

  def self.create_permutations(encrypted_word, number_of_cypher_alphabets=0)
    permutations = []
    (0..number_of_cypher_alphabets).each do |x|
      cypher_alphabet = self.get_alphabet(x)
      permutations << self.decrypt_word(encrypted_word, cypher_alphabet)
    end

    #puts permutations.inspect
    return permutations
  end

  def self.check_word(decypted_array)
    target_words = []
    decypted_array.each do |word|
      if DICTIONARY.include?(word)
        target_words << word
      end
    end

    #puts target_words.inspect
    return target_words
  end

  def caesar_decryption(encrypted_word)
    #break string into an array
    #for each word in the array
      #run create_permutations - returns all possible permutaions
      #run check_word - returns valid words
      #append all valid words to array
    #join array and return
  end

  #Final test - Not Implemented Yet..
  def self.get_caesar_options(cypher)

  end
end