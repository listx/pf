require_relative 'validators.rb'

#class NaTree
#  attr_accessor :render_chain

#  @oid_chain_hash

#  def initialize()
#  end
#end

class Journal
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  has_many :notes
  has_many :attachments

  field :name, type: String
  field :avatar, type: String
  field :avatar_type, type: Integer, default: nil
  # textual representation of notes/attachments graph; we have to generate the
  # natree and other things at runtime
  field :natree, type: String
  # contain the actual rendered contents, so that we don't re-generate the
  # finished document every time; for now, this is raw HTML code!
  field :rendered, type: String
  field :published, type: Boolean, default: false
  field :priority, type: Integer, default: 0

  validates_presence_of :name
  validates_length_of :name, maximum: 80
  validates_with VldBinaryTypesRange, binary_types_key: :avatar_type

  mount_uploader :avatar, ImageUploader

  def gen_natree
    result = parse_natree(self.natree)
  end
end
