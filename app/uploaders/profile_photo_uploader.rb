class ProfilePhotoUploader < CarrierWave::Uploader::Base
  if Rails.env.production?
    storage :fog
  elsif Rails.env.development?
    storage :file
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
