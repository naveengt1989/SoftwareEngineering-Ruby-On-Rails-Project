require 'rails_helper'

RSpec.describe "radio_shows/index", :type => :view do
  before(:each) do
    assign(:radio_shows, [
      RadioShow.create!(
        :user => nil,
        :name => "Name",
        :description => "MyText"
      ),
      RadioShow.create!(
        :user => nil,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of radio_shows" do
    render
    assert_select "tr>td", :text => nil, :count => 0
    assert_select "tr>td", :text => "Name", :count => 0
    assert_select "tr>td", :text => "MyText", :count => 0

  end
end
