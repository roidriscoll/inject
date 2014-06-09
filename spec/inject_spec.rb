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
      result = array.inject(0) { |memo, n| memo + n }
      expect(result).to eq 10
    end
    it 'explicit different memo and block with addition' do
      result = array.inject(1) { |memo, n| memo + n }
      expect(result).to eq 11
    end
    it 'explicit memo and block with multiplication' do
      result = array.inject(1) { |memo, n| memo * n }
      expect(result).to eq 24
    end


  end

  context 'custom inject method should' do
    
    it 'explicit memo and block with addition' do
      result = array.rj_inject(0) { |memo, n| memo + n }
      expect(result).to eq 10
    end
    it 'explicit different memo and block with addition' do
      result = array.rj_inject(1) { |memo, n| memo + n }
      expect(result).to eq 11
    end
    it 'explicit memo and block with multiplication' do
      result = array.rj_inject(1) { |memo,n| memo * n }
      expect(result).to eq 24
    end


  end
  
end