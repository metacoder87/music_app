require 'rails_helper'

RSpec.describe "bands/index", type: :view do
  before(:each) do
    assign(:bands, [
      Band.create!(
        :name => "Name"
      ),
      Band.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of bands" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
