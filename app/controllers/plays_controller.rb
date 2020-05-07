class PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token, only:[:create]
  def create
    Play.create(play_params)
  end

  private

  def play_params
    params.permit(:image_url, :counter)
  end
end
