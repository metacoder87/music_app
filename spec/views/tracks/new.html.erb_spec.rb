require 'rails_helper'

RSpec.describe "tracks/new", type: :view do
  before(:each) do
    assign(:track, Track.new(
      :name => "MyString",
      :album_id => 1,
      :ord => 1,
      :bonus => false,
      :lyrics => "MyText"
    ))
  end

  it "renders new track form" do
    render

    assert_select "form[action=?][method=?]", tracks_path, "post" do

      assert_select "input[name=?]", "track[name]"

      assert_select "input[name=?]", "track[album_id]"

      assert_select "input[name=?]", "track[ord]"

      assert_select "input[name=?]", "track[bonus]"

      assert_select "textarea[name=?]", "track[lyrics]"
    end
  end
end
