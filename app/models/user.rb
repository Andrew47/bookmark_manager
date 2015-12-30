require 'bcrypt'
require 'dm-validations'


class User
  include DataMapper::Resource
  include BCrypt
  has n, :links, through: Resource


  property :id,    Serial
  property :name,  String
  property :email,  String, required: true, unique: true,
  message: "Email address taken"
  property :password , Text
  attr_accessor :password_confirmation
  validates_confirmation_of :password,
  message: "Password does not match confirmation"
  validates_format_of :email, :as => :email_address


  def password_new
    @password_hashed ||= Password.new(password)
  end

  def password_new(new_password)
    @password_hashed = Password.create(new_password)
    self.password = @password_hashed
  end

  def self.authenticate(email, password_given)
    user = first(email: email)
    if user && user.password_new(user.password) == password_given
      user
    else
      nil
    end
  end
end
