class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def set_mount_type(model, mount_sym, model_hash={})
    if model_hash["remove_#{mount_sym.to_s}"] == "1"
      model.send("#{mount_sym.to_s}_type=".to_sym, nil)
      model.save
    elsif !model.send(mount_sym).file.nil?
      ct = model.send(mount_sym).file.content_type
      k = BINARY_TYPES_HASH.invert[ct]
      if k.nil?
        k = 0
      end
      model.send("#{mount_sym.to_s}_type=".to_sym, k)
      model.save
    end
  end
end
