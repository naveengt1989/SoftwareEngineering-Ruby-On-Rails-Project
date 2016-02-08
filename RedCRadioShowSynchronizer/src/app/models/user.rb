class User < ActiveRecord::Base
  has_many :radio_shows, dependent: :destroy
  EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
  validates :userName, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :emailAddress, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :presence => true, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create 
  def self.authenticate(username_or_email="", login_password="")
  if EMAIL_REGEX.match(username_or_email)
    user = User.find_by_emailAddress(username_or_email)
  else
    user = User.find_by_userName(username_or_email)
  end
  if user && user.match_password(login_password, user)
    return user
  else
    return false
  end
  end
  def match_password(login_password="", user)
    if (user.password == login_password)
      return true;
    else
      return false;
    end
  end 
end
