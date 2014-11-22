class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :journal

  field :name, type: String
  field :content, type: BSON::Binary
end
