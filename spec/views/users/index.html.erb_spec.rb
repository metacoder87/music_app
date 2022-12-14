require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :email => "Email",
        :password_digest => "Password Digest",
        :session_token => "Session Token",
        :activated => false,
        :activation_token => "Activation Token"
      ),
      User.create!(
        :email => "Email",
        :password_digest => "Password Digest",
        :session_token => "Session Token",
        :activated => false,
        :activation_token => "Activation Token"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Session Token".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Activation Token".to_s, :count => 2
  end
end
