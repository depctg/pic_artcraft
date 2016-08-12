class PicturesController < ApplicationController
  include PicturesHelper

  def new
    @picture = Picture.new
  end

  def create
    params[:picture][:picture].each do |file|
      picture = Picture.new picture_params(file)
      # TODO error handle
      picture.save
    end
    redirect_to pictures_url
  end

  def index
    @pictures = Picture.all
    respond_to do |format|
      format.html
      format.json do
        render json: pictures_to_json(@pictures)
      end
    end
  end

  private
    def picture_params(file)
      par = {}
      par[:picture] = file
      par[:filename] = file.original_filename
      par
    end

    def pictures_to_json(pictures)
      pictures.map do |pic|
        {
          raw: raw_url(pic),
          download: download_url(pic),
          thumbnail: limit_width_url(pic),
          filename: generate_filename(pic)
        }
      end .to_json
    end
end
