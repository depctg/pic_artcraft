module PicturesHelper
  def limit_width(url, width = 300)
    url + "?imageView2/2/w/#{width}"
  end
end
