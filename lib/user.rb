require 'bcrypt'


class User
      include DataMapper::Resource
      include BCrypt
  has n, :links, through: Resource
  DataMapper::Property::String.length(255)

  property :id,    Serial
  property :name,  String
  property :email,  String
  property :password_hash , Text  


   def password
   @password ||= Password.new(password_hash)
   end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end



  def count
    User.all.size
  end
end
