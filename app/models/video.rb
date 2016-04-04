class Video < ActiveRecord::Base
  mount_uploader :name, VideoUploader
  process_in_background :name

  belongs_to :user
end