require 'spec_helper'

describe HomeController do
  vcr_options = { :record => :new_episodes }
  describe "GET 'index'", vcr: vcr_options do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end
end
