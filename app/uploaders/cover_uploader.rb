class CoverUploader < CarrierWave::Uploader::Base
   include CarrierWave::RMagick
   storage :fog

  def store_dir
    "uploads/covers/#{model.diamond_number}"
  end

  version :grid_cover do
    process resize_to_limit: [nil, 300]
  end
  #
  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

   def filename
     model.cover_file_name if original_filename
   end

end
