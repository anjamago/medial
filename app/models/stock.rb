class Stock < ApplicationRecord
   belongs_to :product, class_name: "Product", foreign_key: "producto"
   has_many :user
end
