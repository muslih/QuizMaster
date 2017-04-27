require 'rails_helper'

RSpec.describe ReadNumber, type: :module do
  
  describe 'convert' do

    it '100' do
      expect(100.read_num)
      .to eq('one hundred')
    end

    it '1000' do
      expect(1_000.read_num).to eq('one thousand')
    end

    it '10000' do
      expect(10_000.read_num).to eq('ten thousand')
    end

    it '100_000' do
      expect(100_000.read_num).to eq('one hundred thousand')
    end

    it '10_000_000' do
      expect(10_000_000.read_num).to eq('ten million')
    end
    
    it '1_000_000_000' do
      expect(1_000_000_000.read_num).to eq('one billion')
    end

    it 'thirteen' do
      expect(13.read_num).to eq('thirteen')
    end

    it '25' do
      expect(25.read_num).to eq('twenty five')
    end

    it '229' do
      expect(229.read_num).to eq('two hundred twenty nine')
    end


    it '6543' do
      expect(6543.read_num).to eq('six thousand five hundred forty three')
    end

  end

end
