require 'rails_helper'

RSpec.describe "radio_shows/show", :type => :view do
  before(:each) do
    @radio_show = assign(:radio_show, RadioShow.create!(
      :user => nil,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
