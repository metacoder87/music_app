require 'rails_helper'

RSpec.describe "notes/edit", type: :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      :track_id => 1,
      :user_id => 1,
      :content => "MyText"
    ))
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", note_path(@note), "post" do

      assert_select "input[name=?]", "note[track_id]"

      assert_select "input[name=?]", "note[user_id]"

      assert_select "textarea[name=?]", "note[content]"
    end
  end
end