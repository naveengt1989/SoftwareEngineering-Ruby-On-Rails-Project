require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :userName => "User Name",
      :hostName => "Host Name",
      :emailAddress => "MyString1@gmail.com",
      :timeServer => "Time Server",
      :password => "Password",
      :location => "Location",
      :flashTime => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User Name/)
    expect(rendered).to match(/Host Name/)
    expect(rendered).to match(/MyString1@gmail.com/)
    expect(rendered).to match(/Time Server/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/1/)
  end
end
