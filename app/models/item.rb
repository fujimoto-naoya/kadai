class Item < ApplicationRecord
  mount_uploader :image, ImagesUploader
  validates :title, length:{ in: 1..100 }
  validates :description, length:{ in: 1..500 }



end
