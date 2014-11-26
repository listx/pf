require_relative 'validators.rb'

class Journal
  include Mongoid::Document
  include Mongoid::Timestamps

  after_initialize :init

  belongs_to :user
  has_many :notes
  has_many :attachments

  field :name, type: String
  field :avatar, type: String, default: nil
  field :avatar_type, type: Integer, default: nil
  field :priority, type: Integer, default: 0

  validates_presence_of :name
  validates_with VldBinaryTypesRange, binary_types_key: :avatar_type

  mount_uploader :avatar, ImageUploader

  def init
    if self.avatar.blank?
      self.avatar = nil
    end
  end
end
