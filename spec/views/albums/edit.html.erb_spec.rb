require 'rails_helper'

RSpec.describe "albums/edit", type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :title => "MyString",
      :year => 1,
      :live => false,
      :band_id => nil
    ))
  end

  it "renders the edit album form" do
    render

    assert_select "form[action=?][method=?]", album_path(@album), "post" do

      assert_select "input[name=?]", "album[title]"

      assert_select "input[name=?]", "album[year]"

      assert_select "input[name=?]", "album[live]"

      assert_select "input[name=?]", "album[band_id_id]"
    end
  end
end
