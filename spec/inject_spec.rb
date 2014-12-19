require 'inject'

# Reopen the Array class or subclass it.
# Rewrite the inject method. Write a test for it first.
# Don't worry about returning an enumerator, assume a block
# is always given
# Name your method differently (that is, not inject() or
# subclass Array) because rspec uses inject() internally,
# so the tests will fail with weird messages unless your
# implementation of inject is perfect.

describe 'inject' do
  let(:array){[1,2,3,4]}

  context 'existing inject method should' do

    it 'explicit memo and block with addition' do
      result = array.inject(0) { |memo, num| memo + num }
      expect(result).to eq 10
    end
    it 'explicit different memo and block with addition' do
      result = array.inject(1) { |memo, num| memo + num }
      expect(result).to eq 11
    end
    it 'explicit memo and block with multiplication' do
      result = array.inject(1) { |memo, num| memo * num }
      expect(result).to eq 24
    end


  end

  context 'custom inject method should' do

    it 'explicit memo and block with addition' do
      result = array.my_inject(0) { |memo, num| memo + num }
      expect(result).to eq 10
    end
    it 'explicit different memo and block with addition' do
      result = array.my_inject(1) { |memo, num| memo + num }
      expect(result).to eq 11
    end
    it 'explicit memo and block with multiplication' do
      result = array.my_inject(1) { |memo,num| memo * num }
      expect(result).to eq 24
    end

  end

  context 'lack of argument affects total when doing stupid things' do


    it 'Ruby\'s with argument' do
      result = array.inject(0) { |memo, num| memo + num + num }
      expect(result).to eq 20
    end
    it 'Ruby\'s without argument' do
      result = array.inject { |memo, num| memo + num + num }
      expect(result).to eq 19
    end
    it 'Mine with argument' do
      result = array.my_inject(0) { |memo, num| memo + num + num }
      expect(result).to eq 20
    end
    it 'Mine without argument' do
      result = array.my_inject { |memo, num| memo + num + num }
      expect(result).to eq 19
    end

  end

end
