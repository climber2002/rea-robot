require 'spec_helper'
require_relative '../lib/robot'
require_relative '../lib/command'

describe Command do 

  let(:robot) { Robot.new }

  describe Command::Report do 

    let(:output) { StringIO.new }
    subject { Command::Report.new(output) }

    context 'when the robot is on the table' do 
      before do
        robot.place(2, 3, Facing::West.instance) 
        subject.execute(robot)
      end

      it 'should output the correct report' do 
        expect(output.string).to eq "2,3,WEST\n"
      end
    end

    context 'when the robot is on the table' do 
      before do
        subject.execute(robot)
      end

      it 'should output nothing' do 
        expect(output.string).to be_empty
      end
    end
    
  end

end