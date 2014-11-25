class VldBinaryTypesRange < ActiveModel::Validator
  def validate(record)
    bt = record.send(options[:binary_types_key])
    if !bt.nil? && (bt < 0 || bt > (BINARY_TYPES_HASH.size - 1))
      record.errors[options[:binary_types_key]] = "has exceeded allowed range"
    end
  end
end
