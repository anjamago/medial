class Product < ApplicationRecord
  has_many :Stock
  belongs_to :Lab, optional: true
  mount_uploader :imagen, ImageUploader
end
