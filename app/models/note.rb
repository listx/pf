require_relative 'validators.rb'

class Note
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveCleaner

  belongs_to :journal

  field :name, type: String
  clean :name, nilify: true
  field :text, type: String
  field :text_type, type: Integer

  validates_length_of :name, maximum: 80
  validates_presence_of :text
  validates_with VldTextTypesRange, text_types_key: :text_type
end
