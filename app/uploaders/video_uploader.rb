class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video

  process encode_video: [:mp4, callbacks: { after_transcode: :set_success } ]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end