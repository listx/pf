class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveCleaner

  # MongoDB/Mongoid requires this SecurePassword import for
  # 'has_secure_password' to work.
  include ActiveModel::SecurePassword

  has_many :journals

  field :name, type: String
  field :password_digest, type: String
  field :name_real, type: String
  field :email, type: String
  field :blog, type: String
  field :github, type: String
  field :linkedin, type: String

  field :copyright, type: String

  clean :name_real, :email, :blog, :github, :linkedin, :copyright, nilify: true
  has_secure_password
end
