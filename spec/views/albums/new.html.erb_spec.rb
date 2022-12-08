require 'rails_helper'

RSpec.describe "albums/new", type: :view do
  before(:each) do
    assign(:album, Album.new(
      :title => "MyString",
      :year => 1,
      :live => false,
      :band_id => nil
    ))
  end

  it "renders new album form" do
    render

    assert_select "form[action=?][method=?]", albums_path, "post" do

      assert_select "input[name=?]", "album[title]"

      assert_select "input[name=?]", "album[year]"

      assert_select "input[name=?]", "album[live]"

      assert_select "input[name=?]", "album[band_id_id]"
    end
  end
end
