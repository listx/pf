require_relative 'validators.rb'

class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :journal

  field :name, type: String
  field :fyle, type: String
  field :fyle_type, type: Integer, default: nil

  before_validation :set_fyle_type

  validates_presence_of :name
  validates_with VldBinaryTypesRange, binary_types_key: :fyle_type

  mount_uploader :fyle, FileUploader

  private
    def set_fyle_type
      if !self.fyle.file.nil?
        ct = self.fyle.file.content_type
        self.fyle_type = (BINARY_TYPES_HASH.invert[ct] ||= 0)
      end
    end
end
