require_relative 'validators.rb'

class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :journal

  field :name, type: String
  field :content, type: BSON::Binary
  field :content_type, type: Integer

  validates_with ValidateBinaryTypesRange, binary_types_key: :content_type
end
