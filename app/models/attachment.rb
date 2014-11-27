require_relative 'validators.rb'

class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :journal

  field :name, type: String
  field :fyle, type: String
  field :fyle_type, type: Integer, default: nil

  validates_presence_of :name
  validates_with VldBinaryTypesRange, binary_types_key: :fyle_type

  mount_uploader :fyle, FileUploader
end
