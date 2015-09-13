# encoding: utf-8

class RecipeUploader < CarrierWave::Uploader::Base



  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  version :avatar_header do
    cloudinary_transformation width: 150, height: 150, crop: :thumb,
      gravity: :face, radius: 10
  end



end
