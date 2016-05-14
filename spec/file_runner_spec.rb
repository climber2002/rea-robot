require 'spec_helper'
require_relative '../lib/file_runner'

# In this spec we test all data files in folder test-data
describe FileRunner do
  
  # This map contains all test data, the key is the filename in test-data without .txt extension, 
  # and the value is the expected output to $stdout
  let(:test_data) {
    { ignore_until_place: '3,3,NORTH', offbounds_place: '', multiple_place: '1,2,WEST',
      normal: '3,3,NORTH', prevent_falloff: '3,0,SOUTH' }
  }

  # Before the test we save the $stdout and redirect the $stdout output to a new StringIO instance
  # so we can check its content. And after the test we set the $stdout back
  before { @old_stdout = $stdout }
  after { $stdout = @old_stdout }

  it 'should process all test data files correctly' do 
    test_data.each do |file_name, expected_result|
      $stdout = StringIO.new
      FileRunner.new("test-data/#{file_name}.txt").run
      expect($stdout.string.chomp).to eq expected_result
    end
  end

end