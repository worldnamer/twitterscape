require 'array_group_by_extension'

describe Array do
  context 'when empty' do
    it 'should return an empty hash when grouped' do
      [].group_by(&:odd?).should == {}
    end
  end

  context 'with data' do
    it 'should return an grouped hash when grouped' do
      [1,2,3].group_by(&:odd?).should == {true => [1,3], false => [2]}
    end
  end
end