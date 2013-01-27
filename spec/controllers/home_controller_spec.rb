require 'spec_helper'

describe HomeController do
  vcr_options = { cassette_name: "home_controller", record: :new_episodes }
  describe "index", vcr: vcr_options do
    it "returns http success" do
      get :index
      response.should be_success
    end
  end
end
