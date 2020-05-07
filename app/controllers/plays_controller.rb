class PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token, only:[:create]
  def create
    @play = Play.new(play_params)
    if @play.save
      respond_to do |format|
        format.json { render json: {url: @play.image_url, count: @play.counter} }
      end
    end
  end

  private

  def play_params
    params.permit(:image_url, :counter)
  end
end
