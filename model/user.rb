# The User class model is used for retrieving and authenticating users.
#
# Author:: www.justkez.com  -  License:: n/a

class User < Sequel::Model
  one_to_many :posts
  one_to_many :comments

  plugin :validation_helpers

  attr_accessor :password
  attr_accessor :password_confirmation

  def after_create
    self.crypted_password = encrypt(password)
    @new = false
    save
  end

  def authenticated?(password)
      crypted_password == encrypt(password)
  end

  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  def self.authenticate(hash)
    email, pass = hash['email'], hash['password']

    if user = User[:email => email]
      return user unless pass
      user if user.authenticated?(pass)
    end
  end
  
  def validate
    validates_unique(:email, :message => 'Email address is already in use.')
    validates_format(/^.+@.+$/, :email, :message => 'Email address is not properly formatted.') if self.email != 'admin'

    validates_min_length(6, :password, :message => 'Password must be at least 6 characters.')

    validates_presence(:username, :message => 'Please enter a username.')
    validates_unique(:username, :message => 'Username is already in use.')   
  end
  
end # User
