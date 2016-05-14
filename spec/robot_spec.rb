require 'spec_helper'
require_relative '../lib/robot'

describe Robot do 

  subject { Robot.new }

  describe 'Initialization' do 
    it 'should not be on the table by default' do 
      expect(subject.on_the_table?).to eq false
    end
  end

  describe '#place' do 
    it 'should place correctly if the place arguments are correct' do 
      expect(subject.place(1, 2, Facing::West.instance)).to eq true
      expect(subject.on_the_table?).to eq true
      expect(subject.x).to eq 1
      expect(subject.y).to eq 2
      expect(subject.facing).to eq Facing::West.instance
    end

    it 'should ingore placing if the position falls off the tabletop' do 
      expect(subject.place(-1, 2, Facing::West.instance)).to eq false
      expect(subject.on_the_table?).to eq false
      expect(subject.x).to be_nil
      expect(subject.y).to be_nil
      expect(subject.facing).to be_nil
    end
  end

  describe '#rotate_left' do 

    context 'when the robot is off the table' do 
      before { expect(subject.on_the_table?).to eq false }

      it 'should ignore the rotate when the robot is not on the table' do 
        expect(subject.rotate_left).to eq false
      end
    end

    context 'when the robot is on the table' do 
      before do 
        subject.place(1, 2, Facing::South.instance)
        expect(subject.facing).to eq Facing::South.instance
      end

      it 'should make correct rotate and remains same position if the robot is on the table' do 
        expect(subject.rotate_left).to eq true
        expect(subject.facing).to eq Facing::East.instance
        expect(subject.x).to eq 1
        expect(subject.y).to eq 2
      end
    end
  end

  describe '#rotate_left' do 
    context 'when the robot is off the table' do 

      before { expect(subject.on_the_table?).to eq false }

      it 'should ignore the rotate when the robot is not on the table' do 
        expect(subject.rotate_right).to eq false
      end
    end

    context 'when the robot is on the table' do 

      before do 
        subject.place(1, 2, Facing::North.instance)
        expect(subject.facing).to eq Facing::North.instance
      end

      it 'should make correct rotate and remains same position if the robot is on the table' do 
        expect(subject.rotate_right).to eq true
        expect(subject.facing).to eq Facing::East.instance
        expect(subject.x).to eq 1
        expect(subject.y).to eq 2
      end
    end
  end

  describe '#move' do 
    context 'when the robot is off the table' do 

      before { expect(subject.on_the_table?).to eq false }

      it 'should ignore the move when the robot is not on the table' do 
        expect(subject.move).to eq false
      end
    end

    context 'when the robot is on the table' do 
      context 'when the robot will not fall off the table after the move' do 

        before do 
          subject.place(1, 2, Facing::North.instance)
        end

        it 'should make the correct move' do
          expect(subject.move).to eq true
          expect(subject.x).to eq 1
          expect(subject.y).to eq 3
          expect(subject.facing).to eq Facing::North.instance
        end
      end

      context 'when the robot will fall off after the move' do 

        before do
          subject.place(2, 0, Facing::South.instance)
        end

        it 'should ignore the move' do 
          expect(subject.move).to eq false
          expect(subject.x).to eq 2
          expect(subject.y).to eq 0
          expect(subject.facing).to eq Facing::South.instance
        end
      end
    end
  end

  describe '#to_s' do 
    context 'when the robot is off the table' do 

      before { expect(subject.on_the_table?).to eq false }

      it { expect(subject.to_s).to eq 'Not on the table' }
    end

    context 'when the robot is on the table' do 
      before do
        subject.place(2, 0, Facing::South.instance)
      end

      it { expect(subject.to_s).to eq '2,0,SOUTH' }
    end
  end
end