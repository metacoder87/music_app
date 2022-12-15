require 'rails_helper'

RSpec.describe "notes/index", type: :view do
  before(:each) do
    assign(:notes, [
      Note.create!(
        :track_id => 2,
        :user_id => 3,
        :content => "MyText"
      ),
      Note.create!(
        :track_id => 2,
        :user_id => 3,
        :content => "MyText"
      )
    ])
  end

  it "renders a list of notes" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
