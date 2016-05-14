require 'spec_helper'
require_relative '../lib/facing'

describe Facing do 

  describe '.parse_facing' do 
    it 'should parse valid strings' do 
      expect(Facing.parse_facing("NORTH")).to eq Facing::North.instance
      expect(Facing.parse_facing("WEST")).to eq Facing::West.instance
      expect(Facing.parse_facing("SOUTH")).to eq Facing::South.instance
      expect(Facing.parse_facing("EAST")).to eq Facing::East.instance
    end

    it 'should raise ArgumentError if the facing is not recognizable' do
      expect { Facing.parse_facing("Invalid") }.to raise_error(ArgumentError)
    end

    it 'should raise ArgumentError if the facing is empty or nil' do 
      expect { Facing.parse_facing("") }.to raise_error(ArgumentError)
      expect { Facing.parse_facing(nil) }.to raise_error(ArgumentError)
    end
  end

end