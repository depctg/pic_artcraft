class PicturesController < ApplicationController
  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new picture_params
    if @picture.save
      redirect_to pictures_url
    else
      render :new
    end
  end

  def index
    @pictures = Picture.all
  end

  private
    def picture_params
      def valid_picture_params
        params.require(:picture).permit(:picture, :title, :author)
      end

      par = valid_picture_params
      # TODO: formal method to check and build meta info
      if par
        par[:filename] = par[:picture].original_filename
      end

      par
    end
end
