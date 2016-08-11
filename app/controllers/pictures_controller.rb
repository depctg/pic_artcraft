class PicturesController < ApplicationController
  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new picture_params
    if @picture.save
      render :new
    else
      render :new
    end
  end

  def index
    @pictures = Picture.all
  end

  private
    def picture_params
      params.require(:picture).permit(:picture)
    end
end
