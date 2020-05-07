require 'fileutils'

class GamesController < ApplicationController
  def index
    cookies[:image_urls] = nil
  end

  def store_images
    @image_urls = cookies[:image_urls] = img_public_paths if params[:image].present?
  end

  private

  def copy_file_to_public(image)
    tmp = image.tempfile
    file = File.join('public', image.original_filename)
    FileUtils.cp tmp.path, file
  end

  def img_public_paths
    params[:image].each_with_object([]) do |image, image_urls|
      copy_file_to_public(image)
      image_urls << image.original_filename
    end
  end
end
