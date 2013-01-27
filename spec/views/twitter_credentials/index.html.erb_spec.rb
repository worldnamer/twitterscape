require 'spec_helper'

describe "twitter_credentials/index" do
  before(:each) do
    assign(:twitter_credentials, [
      stub_model(TwitterCredential,
        :consumer_key => "Consumer Key",
        :consumer_secret => "Consumer Secret",
        :oauth_token => "Oauth Token",
        :oauth_token_secret => "Oauth Token Secret"
      ),
      stub_model(TwitterCredential,
        :consumer_key => "Consumer Key",
        :consumer_secret => "Consumer Secret",
        :oauth_token => "Oauth Token",
        :oauth_token_secret => "Oauth Token Secret"
      )
    ])
  end

  it "renders a list of twitter_credentials" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Consumer Key".to_s, :count => 2
    assert_select "tr>td", :text => "Consumer Secret".to_s, :count => 2
    assert_select "tr>td", :text => "Oauth Token".to_s, :count => 2
    assert_select "tr>td", :text => "Oauth Token Secret".to_s, :count => 2
  end
end
