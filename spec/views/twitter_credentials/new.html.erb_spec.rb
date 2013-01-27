require 'spec_helper'

describe "twitter_credentials/new" do
  before(:each) do
    assign(:twitter_credential, stub_model(TwitterCredential,
      :consumer_key => "MyString",
      :consumer_secret => "MyString",
      :oauth_token => "MyString",
      :oauth_token_secret => "MyString"
    ).as_new_record)
  end

  it "renders new twitter_credential form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => twitter_credentials_path, :method => "post" do
      assert_select "input#twitter_credential_consumer_key", :name => "twitter_credential[consumer_key]"
      assert_select "input#twitter_credential_consumer_secret", :name => "twitter_credential[consumer_secret]"
      assert_select "input#twitter_credential_oauth_token", :name => "twitter_credential[oauth_token]"
      assert_select "input#twitter_credential_oauth_token_secret", :name => "twitter_credential[oauth_token_secret]"
    end
  end
end
