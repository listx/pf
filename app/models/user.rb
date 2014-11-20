class User
  include Mongoid::Document

  # MongoDB/Mongoid requires this SecurePassword import for
  # 'has_secure_password' to work.
  include ActiveModel::SecurePassword

  field :name, type: String
  field :password_digest, type: String
  has_secure_password
end
