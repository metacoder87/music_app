require 'rails_helper'

RSpec.describe "albums/show", type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :title => "Title",
      :year => 2,
      :live => false,
      :band_id => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
