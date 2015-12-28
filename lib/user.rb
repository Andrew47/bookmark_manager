require 'bcrypt'
require 'dm-validations'


class User
      include DataMapper::Resource
      include BCrypt
  has n, :links, through: Resource


  property :id,    Serial
  property :name,  String
  property :email,  String
  property :password , Text
  attr_accessor :password_confirmation
  validates_confirmation_of :password


   def password_new
   @password_hashed ||= Password.new(password)
   end

  def password_new(new_password)
    @password_hashed = Password.create(new_password)
    self.password = @password_hashed
  end



  # def count
  #   User.all.size
  # end
end
