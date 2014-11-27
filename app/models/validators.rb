require 'active_model'

class VldBinaryTypesRange < ActiveModel::Validator
  def validate(record)
    k = record.send(options[:binary_types_key])
    if !k.nil? && (k < 0 || k > (BINARY_TYPES_HASH.size - 1))
      record.errors[options[:binary_types_key]] = "has exceeded allowed range"
    end
  end
end

class VldTextTypesRange < ActiveModel::Validator
  def validate(record)
    k = record.send(options[:text_types_key])
    if !k.nil? && (k < 0 || k > (TEXT_TYPES_HASH.size - 1))
      record.errors[options[:text_types_key]] = "has exceeded allowed range"
    end
  end
end
