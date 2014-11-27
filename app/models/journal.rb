require_relative 'validators.rb'

class Journal
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  has_many :notes
  has_many :attachments

  field :name, type: String
  field :avatar, type: String
  field :avatar_type, type: Integer, default: nil
  field :priority, type: Integer, default: 0

  before_validation :set_avatar_type

  validates_presence_of :name
  validates_with VldBinaryTypesRange, binary_types_key: :avatar_type

  mount_uploader :avatar, ImageUploader

  private
    def set_avatar_type
      if !self.avatar.file.nil?
        ct = self.avatar.file.content_type
        self.avatar_type = (BINARY_TYPES_HASH.invert[ct] ||= 0)
      end
    end
end
