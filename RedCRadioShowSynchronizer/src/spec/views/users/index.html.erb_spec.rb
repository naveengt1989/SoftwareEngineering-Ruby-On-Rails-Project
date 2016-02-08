require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :userName => "UserName",
        :hostName => "HostName",
        :emailAddress => "MyString@gmail.com",
        :timeServer => "TimeServer",
        :password => "Password",
        :location => "Location",
        :flashTime => 1
      ),
      User.create!(
        :userName => "UserName1",
        :hostName => "HostName1",
        :emailAddress => "MyString1@gmail.com",
        :timeServer => "TimeServer",
        :password => "Password1",
        :location => "Location",
        :flashTime => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "UserName".to_s, :count => 1
    assert_select "tr>td", :text => "HostName".to_s, :count => 1
    assert_select "tr>td", :text => "MyString@gmail.com".to_s, :count => 1
    assert_select "tr>td", :text => "TimeServer".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 1
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
