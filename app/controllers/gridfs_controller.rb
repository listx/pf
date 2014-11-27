class GridfsController < ApplicationController
  before_action :set_gridfs_context, only: [:serve]
  def serve
    content = @upload.read
    if stale?(\
        etag: content,\
        last_modified: @last_modified,\
        public: true)

      send_data content,\
        type: @upload.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

  private
    def set_gridfs_context
      model = FILE_MODEL_HASH[params[:model]].find(params[:id])
      mount = params[:mounted_as].to_sym
      @last_modified = model.updated_at.utc

      if (params[:filename].match /^thumb_/).nil?
        @upload = model.send(mount)
      else
        @upload = model.send(mount).thumb
      end
    end
end
