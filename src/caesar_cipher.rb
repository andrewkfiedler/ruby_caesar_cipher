# frozen_string_literal: true

require 'pry'
# The caesar cipher is performed by shifting the letter to the left 3.
# For example: d => a, a => y
# Longer example: dad => aya
# Case should be preserved!
class CaesarCipher
  LOWERCASE_START = 'a'.ord
  UPPERCASE_START = 'A'.ord
  LOWERCASE_END = 'z'.ord
  UPPERCASE_END = 'Z'.ord

  def initialize(amt)
    @shift_factor = amt
  end

  def uppercase?(character = '')
    character.ord.between?(UPPERCASE_START, UPPERCASE_END)
  end

  def lowercase?(character = '')
    character.ord.between?(LOWERCASE_START, LOWERCASE_END)
  end

  def should_encode?(character)
    lowercase?(character) || uppercase?(character)
  end

  def encode_with_boundaries(character, lower_bound, upper_bound)
    ord = character.ord
    new_ord = ord - @shift_factor
    if new_ord < lower_bound
      new_ord = (new_ord - lower_bound).abs
      # add 1 here, since going across the boundary counts as 1
      new_ord = 1 + upper_bound - new_ord
    end
    new_ord.chr
  end

  def encode_lowercase(character)
    encode_with_boundaries(character, LOWERCASE_START, LOWERCASE_END)
  end

  def encode_uppercase(character)
    encode_with_boundaries(character, UPPERCASE_START, UPPERCASE_END)
  end

  def decode_with_boundaries(character, lower_bound, upper_bound)
    ord = character.ord
    new_ord = ord + @shift_factor
    if new_ord > upper_bound
      new_ord = (new_ord - upper_bound).abs
      # sub 1 here, since going across the boundary counts as 1
      new_ord = -1 + lower_bound + new_ord
    end
    new_ord.chr
  end

  def decode_lowercase(character)
    decode_with_boundaries(character, LOWERCASE_START, LOWERCASE_END)
  end

  def decode_uppercase(character)
    decode_with_boundaries(character, UPPERCASE_START, UPPERCASE_END)
  end

  def encode(to_encode)
    (to_encode.split('').map do |part|
      next part unless should_encode?(part)
      next encode_lowercase(part) if lowercase?(part)
      next encode_uppercase(part) if uppercase?(part)
    end).join('')
  end

  def decode(to_decode)
    (to_decode.split('').map do |part|
      next part unless should_encode?(part)
      next decode_lowercase(part) if lowercase?(part)
      next decode_uppercase(part) if uppercase?(part)
    end).join('')
  end
end
