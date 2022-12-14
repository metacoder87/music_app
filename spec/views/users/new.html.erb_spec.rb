require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :email => "MyString",
      :password_digest => "MyString",
      :session_token => "MyString",
      :activated => false,
      :activation_token => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[password_digest]"

      assert_select "input[name=?]", "user[session_token]"

      assert_select "input[name=?]", "user[activated]"

      assert_select "input[name=?]", "user[activation_token]"
    end
  end
end
