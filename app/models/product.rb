class Product < ApplicationRecord
  has_many :sales, dependent: :destroy
  belongs_to :user
end
