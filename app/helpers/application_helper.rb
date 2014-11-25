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
end
