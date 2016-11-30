class Product < ApplicationRecord
  has_many :Stock
  belongs_to :Lab
end
