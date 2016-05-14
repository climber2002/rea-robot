require 'spec_helper'
require_relative '../lib/command_parser'
require_relative '../lib/facing'
require_relative '../lib/command'

describe CommandParser do 

  subject { CommandParser.new }

  describe 'parse REPLACE command' do 

    it 'should parse succssfully for a valid PLACE command' do 
      command = subject.parse("PLACE 2,3,WEST")
      expect(command.x).to eq 2
      expect(command.y).to eq 3
      expect(command.facing).to eq Facing::West.instance
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
      command = subject.parse("MOVE")
      expect(command).to be_a(Command::Move)
    end

    it 'should parse succssfully when there are trailing spaces' do 
      command = subject.parse("MOVE   ")
      expect(command).to be_a(Command::Move)
    end

    it 'should raise error when there are arguments' do 
      expect { subject.parse("MOVE 2") }.to raise_error(ArgumentError)
    end
  end

  describe 'parse REPORT command' do 
    it 'should parse succssfully for a valid REPORT command' do 
      command = subject.parse("REPORT")
      expect(command).to be_a(Command::Report)
    end
  end

  describe 'parse LEFT command' do 
    it 'should parse succssfully for a valid LEFT command' do 
      command = subject.parse("LEFT")
      expect(command).to be_a(Command::Left)
    end
  end

  describe 'parse RIGHT command' do 
    it 'should parse succssfully for a valid RIGHT command' do 
      command = subject.parse("RIGHT")
      expect(command).to be_a(Command::Right)
    end
  end
end