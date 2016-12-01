require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password_digest, Text

  attr_accessor :password_confirmation

  validates_confirmation_of :password, :password_confirmation

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end



end
