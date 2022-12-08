require 'rails_helper'

RSpec.describe "bands/show", type: :view do
  before(:each) do
    @band = assign(:band, Band.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
