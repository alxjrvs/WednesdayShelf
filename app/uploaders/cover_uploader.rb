class CoverUploader < CarrierWave::Uploader::Base
   #include CarrierWave::RMagick

  def store_dir
    "uploads/covers/#{model.diamond_number}"
  end

  version :grid_cover do
    process resize_to_limit: [nil, 300]
  end

  version :highlight_cover do
    process resize_to_limit: [nil, 460]
  end

   def filename
     model.cover_file_name if original_filename
   end

end
