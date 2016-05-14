require 'spec_helper'
require_relative '../lib/robot'
require_relative '../lib/command_parser'
require_relative '../lib/facing'

describe CommandParser do 

  subject { CommandParser.new }

  describe 'parse REPLACE command' do 

    it 'should parse succssfully for a valid PLACE command' do 
      place_command = subject.parse("PLACE 2,3,WEST")
      expect(place_command.x).to eq 2
      expect(place_command.y).to eq 3
      expect(place_command.facing).to eq Facing::West.instance
    end

    it 'should raise error if the facing is missing' do 
      expect { subject.parse("PLACE 2,3") }.to raise_error(ArgumentError)
    end

    it 'should raise error if the facing is unrecognizable' do 
      expect { subject.parse("PLACE 2,3,Invalid") }.to raise_error(ArgumentError)
    end
  end

  describe 'parse MOVE command' do
    it 'should parse succssfully for a valid MOVE command' do 
      move_command = subject.parse("MOVE")
      expect(move_command).to be_a(Command::Move)
    end

    it 'should parse succssfully when there are trailing spaces' do 
      move_command = subject.parse("MOVE   ")
      expect(move_command).to be_a(Command::Move)
    end

    it 'should raise error when there are arguments' do 
      expect { subject.parse("MOVE 2") }.to raise_error(ArgumentError)
    end
  end
end