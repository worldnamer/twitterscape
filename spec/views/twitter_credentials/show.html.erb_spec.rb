require 'spec_helper'

describe "twitter_credentials/show" do
  before(:each) do
    @twitter_credential = assign(:twitter_credential, stub_model(TwitterCredential,
      :consumer_key => "Consumer Key",
      :consumer_secret => "Consumer Secret",
      :oauth_token => "Oauth Token",
      :oauth_token_secret => "Oauth Token Secret"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Consumer Key/)
    rendered.should match(/Consumer Secret/)
    rendered.should match(/Oauth Token/)
    rendered.should match(/Oauth Token Secret/)
  end
end
