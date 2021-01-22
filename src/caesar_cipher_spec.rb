# frozen_string_literal: true

require_relative './caesar_cipher'

RSpec.describe 'Flex the cipher' do
  it 'encodes the alphabet' do
    caesar_cipher = CaesarCipher.new(3)
    expect(caesar_cipher.encode('ABCDEFGHIJKLMNOPQRSTUVWXYZ')).to eq('XYZABCDEFGHIJKLMNOPQRSTUVW')
  end
  it 'decodes the alphabet' do
    caesar_cipher = CaesarCipher.new(3)
    expect(caesar_cipher.decode('XYZABCDEFGHIJKLMNOPQRSTUVW')).to eq('ABCDEFGHIJKLMNOPQRSTUVWXYZ')
  end
  it 'encodes the alphabet lowercase' do
    caesar_cipher = CaesarCipher.new(3)
    expect(caesar_cipher.encode('ABCDEFGHIJKLMNOPQRSTUVWXYZ'.swapcase)).to eq('XYZABCDEFGHIJKLMNOPQRSTUVW'.swapcase)
  end
  it 'decodes the alphabet uppercase' do
    caesar_cipher = CaesarCipher.new(3)
    expect(caesar_cipher.decode('XYZABCDEFGHIJKLMNOPQRSTUVW'.swapcase)).to eq('ABCDEFGHIJKLMNOPQRSTUVWXYZ'.swapcase)
  end
  it 'encodes and ignores non alphabet stuff' do
    caesar_cipher = CaesarCipher.new(3)
    expect(caesar_cipher.encode('THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG')).to eq('QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD')
  end
  it 'decodes and ignores non alphabet stuff' do
    caesar_cipher = CaesarCipher.new(3)
    expect(caesar_cipher.decode('QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD')).to eq('THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG')
  end
end
