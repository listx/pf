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

  validates_presence_of :name
  validates_with VldBinaryTypesRange, binary_types_key: :avatar_type

  mount_uploader :avatar, ImageUploader
end
