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

  def test_decrypt_word_with_basic_alphabet
    assert_equal P12.decrypt_word("CD", "BCDEFGHIJKLMNOPQRSTUVWXYZA"), "BC"
  end

  def test_cypher_parsed_26_ways
    assert_equal 26, P12.get_caesar_options(@test_cyper).count
  end

end