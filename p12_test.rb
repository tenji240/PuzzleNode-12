require 'minitest/autorun'
require './p12'

class P12Test < Minitest::Test
  def setup
    @test_cyper = "ABC"
  end

  def test_rotate_once
    example_array = %w(a b c d)
    assert_equal %w(b c d a), P12.rotate(example_array)
  end

  def test_rotate_multiple_times
    example_array = %w(a b c d)
    assert_equal %w(c d a b), P12.rotate(example_array, 2)
  end

  def test_get_alphabet_basic_gets_normal_alphabet
    assert_equal P12.get_alphabet, "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  end

  def test_get_alphabet_with_shift
    assert_equal P12.get_alphabet(1), "BCDEFGHIJKLMNOPQRSTUVWXYZA"
    assert_equal P12.get_alphabet(5), "FGHIJKLMNOPQRSTUVWXYZABCDE"
  end

  #can take a word and generate the conversion
  def test_decrypt_word_with_standard_alphabet
    assert_equal P12.decrypt_word("BC", "BCDEFGHIJKLMNOPQRSTUVWXYZA"), "AB"
    assert_equal P12.decrypt_word("URIO", "DEFGHIJKLMNOPQRSTUVWXYZABC"), "ROFL"
  end

  def test_get_multiple_decryptions_from_shift_amount
    assert_equal ["BC","AB","ZA","YZ", "XY"], P12.create_permutations("BC", 4)
    assert_equal ["ROFL", "QNEK", "PMDJ", "OLCI"], P12.create_permutations("ROFL", 3)
  end

  def test_run_decryption
    assert_equal true, P12.create_permutations("FRZDUGV",25).include?("COWARDS")
  end

  def test_cross_check_word_with_dictionary
    assert_equal [], P12.check_word(["FBASGAD", "DABSADA", "ASDAASA"])
    assert_equal ["COWARDS"], P12.check_word(["COWARDS", "FASADADA", "BHAJKDA"])
    assert_equal ["COWARDS"], P12.check_word(P12.create_permutations("FRZDUGV",25))
  end

=begin
  def test_cypher_parsed_26_ways
    assert_equal 26, P12.get_caesar_options(@test_cyper).count
  end
=end

end