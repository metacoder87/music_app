require 'rails_helper'

RSpec.describe "albums/index", type: :view do
  before(:each) do
    assign(:albums, [
      Album.create!(
        :title => "Title",
        :year => 2,
        :live => false,
        :band_id => nil
      ),
      Album.create!(
        :title => "Title",
        :year => 2,
        :live => false,
        :band_id => nil
      )
    ])
  end

  it "renders a list of albums" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
