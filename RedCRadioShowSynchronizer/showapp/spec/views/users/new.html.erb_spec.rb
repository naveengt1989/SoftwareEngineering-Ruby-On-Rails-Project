require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before(:each) do
    assign(:user, User.new(
      :userName => "MyString",
      :hostName => "MyString",
      :emailAddress => "MyString",
      :timeServer => "MyString",
      :password => "MyString",
      :location => "MyString",
      :flashTime => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_userName[name=?]", "user[userName]"

      assert_select "input#user_hostName[name=?]", "user[hostName]"

      assert_select "input#user_emailAddress[name=?]", "user[emailAddress]"

      assert_select "input#user_timeServer[name=?]", "user[timeServer]", :count => 0

      assert_select "input#user_password[name=?]", "user[password]"

      assert_select "input#user_location[name=?]", "user[location]"

      assert_select "input#user_flashTime[name=?]", "user[flashTime]" , :count => 0
    end
  end
end
