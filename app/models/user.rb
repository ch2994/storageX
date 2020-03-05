class User < ActiveRecord::Base
  # attr_accessor :password
  # validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  # validates :password, :confirmation => true #password_confirmation attr
  # validates_length_of :password, :in => 6..20, :on => :create

  def self.authenticate(username="", login="")
    print(username)
    # user = User.find_by_username(username)
    # print(user)
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

end