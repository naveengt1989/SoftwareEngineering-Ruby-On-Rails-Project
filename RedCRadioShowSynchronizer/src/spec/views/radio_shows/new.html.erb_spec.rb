require 'rails_helper'

RSpec.describe "radio_shows/new", :type => :view do
  before(:each) do
    assign(:radio_show, RadioShow.new(
      :user_id => nil,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new radio_show form" do
    render

      assert_select "form[action=?][method=?]", radio_shows_path, "post" do

      assert_select "input#radio_show_user_id[name=?]", nil , :count => 0

      assert_select "input#radio_show_name[name=?]", "MyString" , :count => 0

      assert_select "textarea#radio_show_description[name=?]", "MyText" , :count => 0
    end
  end
end
