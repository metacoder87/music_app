require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "Email",
      :password_digest => "Password Digest",
      :session_token => "Session Token",
      :activated => false,
      :activation_token => "Activation Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/Session Token/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Activation Token/)
  end
end
