class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video
  include CarrierWave::FFmpeg

  process encode_video: [:mp4, resolution: '640x360                    ' ]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :mp4 do
    def full_filename(for_file)
      super.chomp(File.extname(super)) + '.mp4'
    end
  end

end