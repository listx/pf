module ApplicationHelper
  def is_active?(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def nil_na(obj)
    if obj.nil?
      "N/A"
    else
      obj
    end
  end

  def binary_types_group?(k, sym)
    BINARY_TYPES_HASH[k] =~ Regexp.new("^#{sym.to_s}\/")
  end

  def binary_file_view(model, mount_sym)
    file_type = model.send("#{mount_sym.to_s}_type".to_sym)
    file_url = model.send("#{mount_sym.to_s}_url".to_sym)
    if binary_types_group?(file_type, :image)
      image_tag file_url(:thumb)
    else
      link_to 'file', file_url
    end
  end
end
