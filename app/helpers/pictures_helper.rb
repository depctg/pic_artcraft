module PicturesHelper

  def raw_url(pic)
    pic.picture.url
  end

  def limit_width_url(pic, width = 300)
    pic.picture.url + "?imageView2/2/w/#{width}"
  end

  def download_url(pic)
    pic.picture.url + "?download/#{generate_filename(pic)}"
  end

  def generate_filename(picture)
    picture.filename
  end
end
