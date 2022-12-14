require 'rails_helper'

RSpec.describe "tracks/edit", type: :view do
  before(:each) do
    @track = assign(:track, Track.create!(
      :name => "MyString",
      :album_id => 1,
      :ord => 1,
      :bonus => false,
      :lyrics => "MyText"
    ))
  end

  it "renders the edit track form" do
    render

    assert_select "form[action=?][method=?]", track_path(@track), "post" do

      assert_select "input[name=?]", "track[name]"

      assert_select "input[name=?]", "track[album_id]"

      assert_select "input[name=?]", "track[ord]"

      assert_select "input[name=?]", "track[bonus]"

      assert_select "textarea[name=?]", "track[lyrics]"
    end
  end
end
