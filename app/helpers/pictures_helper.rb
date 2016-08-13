module PicturesHelper

  def raw_url(pic)
    pic.picture.url
  end

  def thumbnail_url(pic, height = 250)
    pic.picture.url + "?imageView2/2/h/#{height}"
  end

  def download_url(pic)
    pic.picture.url + "?download/#{generate_filename(pic)}"
  end

  def generate_filename(picture)
    picture.filename
  end
end
