require 'rails_helper'

RSpec.describe "radio_shows/edit", :type => :view do
  before(:each) do
    @radio_show = assign(:radio_show, RadioShow.create!(
      :user => nil,
      :name => "MyString",
      :description => "MyText"
    ))
  end

=begin
  it "renders the edit radio_show form" do
    render

    assert_select "form[action=?][method=?]", radio_show_path(@radio_show), "post" do

      assert_select "input#radio_show_user_id[name=?]", "radio_show[user_id]"

      assert_select "input#radio_show_name[name=?]", "radio_show[name]"

      assert_select "textarea#radio_show_description[name=?]", "radio_show[description]"
    end
  end
=end
end
