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

  def content_rmatch(str, sym)
    str =~ Regexp.new("^#{sym.to_s}\/")
  end

  def binary_file_view(model, mount_sym)
    file_type = model.send("#{mount_sym.to_s}_type".to_sym)
    file_url = model.send("#{mount_sym.to_s}_url".to_sym)
    if content_rmatch(BINARY_TYPES_HASH[file_type], :image)
      image_tag file_url
    else
      link_to File.basename(model.send(mount_sym.to_s).to_s), file_url
    end
  end

  def show_background_img_css_attr
    case params[:controller]
    when 'welcome'
    when 'sessions'
    when 'journals'
      if params[:action] != "exhibit"
        "no-background"
      end
    else
      "no-background"
    end
  end

  def name_or_namereal
    @ruser.name_real.nil? ? @ruser.name : @ruser.name_real
  end
end
