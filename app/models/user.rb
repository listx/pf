class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # MongoDB/Mongoid requires this SecurePassword import for
  # 'has_secure_password' to work.
  include ActiveModel::SecurePassword

  has_many :journals

  field :name, type: String
  field :password_digest, type: String
  has_secure_password
end
