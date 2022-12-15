require 'rails_helper'

RSpec.describe "notes/new", type: :view do
  before(:each) do
    assign(:note, Note.new(
      :track_id => 1,
      :user_id => 1,
      :content => "MyText"
    ))
  end

  it "renders new note form" do
    render

    assert_select "form[action=?][method=?]", notes_path, "post" do

      assert_select "input[name=?]", "note[track_id]"

      assert_select "input[name=?]", "note[user_id]"

      assert_select "textarea[name=?]", "note[content]"
    end
  end
end
