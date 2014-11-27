class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def nullify_mount_type(model, mount, model_hash)
    if model_hash["remove_#{mount.to_s}"] == "1"
      model.send("#{mount.to_s}_type=".to_sym, nil)
      model.save
    end
  end
end
