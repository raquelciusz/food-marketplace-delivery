class Product < ApplicationRecord
  has_many :sales, dependent: :destroy
  belongs_to :user
  has_many_attached :photos
end
