class Journal
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  has_many :notes
  has_many :attachments

  field :title, type: String
  field :avatar, type: BSON::ObjectId
  field :priority, type: Integer
end
