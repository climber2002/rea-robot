require 'spec_helper'
require_relative '../lib/tabletop'

describe Tabletop do 

  subject { Tabletop.new(5, 5) }

  describe 'Creation' do 
    it 'should have valid dimensions' do
      expect(subject.x_dimension).to eq 5
      expect(subject.y_dimension).to eq 5    
    end
  end

  describe '#falls_within?  #falls_off?' do 
    it 'should fall within for the origin point(0, 0)' do 
      expect(subject.falls_within?(0, 0)).to eq true
      expect(subject.falls_off?(0, 0)).to eq false
    end

    it 'should fall off if x < 0' do 
      expect(subject.falls_within?(-1, 0)).to eq false
      expect(subject.falls_off?(-1, 0)).to eq true
    end

    it 'should fall off if y < 0' do 
      expect(subject.falls_within?(0, -1)).to eq false
      expect(subject.falls_off?(0, -1)).to eq true
    end

    it 'should fall within if the point is within the dimensions' do 
      expect(subject.falls_within?(2, 2)).to eq true
      expect(subject.falls_off?(2, 2)).to eq false
    end

    it 'should fall off if x is beyond x-dimension' do 
      expect(subject.falls_within?(5, 2)).to eq false
      expect(subject.falls_off?(5, 2)).to eq true
    end

    it 'should fall off if y is beyond y-dimension' do 
      expect(subject.falls_within?(2, 6)).to eq false
      expect(subject.falls_off?(2, 6)).to eq true
    end

    it 'should fall within for the NORTH EAST most point' do 
      expect(subject.falls_within?(4, 4)).to eq true
      expect(subject.falls_off?(4, 4)).to eq false
    end
  end
end