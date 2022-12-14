require 'rails_helper'

RSpec.describe "tracks/index", type: :view do
  before(:each) do
    assign(:tracks, [
      Track.create!(
        :name => "Name",
        :album_id => 2,
        :ord => 3,
        :bonus => false,
        :lyrics => "MyText"
      ),
      Track.create!(
        :name => "Name",
        :album_id => 2,
        :ord => 3,
        :bonus => false,
        :lyrics => "MyText"
      )
    ])
  end

  it "renders a list of tracks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
