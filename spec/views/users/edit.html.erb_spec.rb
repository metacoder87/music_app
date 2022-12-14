require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "MyString",
      :password_digest => "MyString",
      :session_token => "MyString",
      :activated => false,
      :activation_token => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[password_digest]"

      assert_select "input[name=?]", "user[session_token]"

      assert_select "input[name=?]", "user[activated]"

      assert_select "input[name=?]", "user[activation_token]"
    end
  end
end
