require 'facing'

describe Facing do 

  describe '.parse_facing' do 
    it 'should parse valid strings' do 
      expect(Facing.parse_facing("NORTH")).to be Facing::North.instance
      expect(Facing.parse_facing("WEST")).to be Facing::West.instance
      expect(Facing.parse_facing("SOUTH")).to be Facing::South.instance
      expect(Facing.parse_facing("EAST")).to be Facing::East.instance
    end

    it 'should raise ArgumentError if the facing is not recognizable' do
      expect { Facing.parse_facing("Invalid") }.to raise_error(ArgumentError)
    end

    it 'should raise ArgumentError if the facing is empty or nil' do 
      expect { Facing.parse_facing("") }.to raise_error(ArgumentError)
      expect { Facing.parse_facing(nil) }.to raise_error(ArgumentError)
    end
  end

  describe Facing::North do 
    subject { Facing::North.instance }

    it { expect(subject.rotate_left).to be Facing::West.instance }
    it { expect(subject.rotate_right).to be Facing::East.instance }
    it { expect(subject.next_move_position(2, 3)).to eq [2, 4] }
  end

  describe Facing::West do 
    subject { Facing::West.instance }
    it { expect(subject.rotate_left).to be Facing::South.instance }
    it { expect(subject.rotate_right).to be Facing::North.instance }
    it { expect(subject.next_move_position(2, 3)).to eq [1, 3] }
  end

  describe Facing::South do 
    subject { Facing::South.instance }
    it { expect(subject.rotate_left).to be Facing::East.instance }
    it { expect(subject.rotate_right).to be Facing::West.instance }
    it { expect(subject.next_move_position(2, 3)).to eq [2, 2] }
  end

  describe Facing::East do 
    subject { Facing::East.instance }
    it { expect(subject.rotate_left).to be Facing::North.instance }
    it { expect(subject.rotate_right).to be Facing::South.instance }
    it { expect(subject.next_move_position(2, 3)).to eq [3, 3] }
  end

end