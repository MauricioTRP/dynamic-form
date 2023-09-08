class Region < ApplicationRecord
  has_many :provinces, dependent: :destroy
  has_many :comunes, through: :provinces
end
