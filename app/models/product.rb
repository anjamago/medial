class Product < ApplicationRecord
  has_many :Stock, foreign_key: "producto"
  belongs_to :Lab, optional: true
  mount_uploader :imagen, ImageUploader
end
