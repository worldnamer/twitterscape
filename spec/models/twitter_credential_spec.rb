require 'spec_helper'

describe TwitterCredential do
  it "can be instantiated" do
    TwitterCredential.new.should be_an_instance_of(TwitterCredential)
  end
end
