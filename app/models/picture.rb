class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  paginates_per 20
end
