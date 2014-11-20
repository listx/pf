class User
  include Mongoid::Document
  field :name, type: String
  field :password, type: Digest
end
