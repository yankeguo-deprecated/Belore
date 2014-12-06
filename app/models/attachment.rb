class Attachment < ActiveRecord::Base
  mount_uploader :store, AttachmentUploader
end
