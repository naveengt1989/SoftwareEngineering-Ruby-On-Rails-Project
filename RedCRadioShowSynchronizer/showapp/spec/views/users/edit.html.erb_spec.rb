require 'rails_helper'

RSpec.describe "users/edit", :type => :view do

  before(:each) do
    @user = assign(:user, User.create!(
      :userName => "MyString",
      :hostName => "MyString",
      :emailAddress => "MyString@gmail.com" ,
      :timeServer => "MyString",
      :password => "MyString",
      :location => "MyString",
      :flashTime => nil
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_userName[name=?]", "user[userName]"

      assert_select "input#user_hostName[name=?]", "user[hostName]"

      assert_select "input#user_emailAddress[name=?]", "user[emailAddress]"

      assert_select "input#user_timeServer[name=?]", "user[timeServer]", :count => 0

      assert_select "input#user_password[name=?]", "user[password]"

      assert_select "input#user_location[name=?]", "user[location]"

      assert_select "input#user_flashTime[name=?]", "user[flashTime]", :count => 0
    end
  end
end
