require 'hash_to_array_of_hashes_extension'

describe Hash do
  context 'when empty' do
    it 'should return an empty array' do
      {}.to_array_of_hashes(:name, :value).should be_empty
    end
  end

  context 'with data' do
    it 'should return the tuples as an array' do
      {test_name: "test_value"}.to_array_of_hashes(:name, :value).should == [{name: :test_name, value: "test_value"}]
    end
  end
end