# encoding: utf-8
require 'carrierwave/processing/mime_types'
class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [500, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  version :thumb do
    resize_to_fill(50,50)
  end

  version :small do
    resize_to_fit(550,350)
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "photo.jpg" if original_filename
  end

end
