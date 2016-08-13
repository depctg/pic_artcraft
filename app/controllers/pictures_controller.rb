class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def create
    params.require(:picture).require(:picture)
    params[:picture][:picture].each do |file|
      picture = Picture.new picture_params(file)
      # TODO error handle
      picture.save
    end
    redirect_to pictures_url
  end

  def index
    @pictures = Picture.page params[:page]
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
    def picture_params(file)
      par = {}
      par[:picture] = file
      par[:filename] = file.original_filename
      par
    end

end
