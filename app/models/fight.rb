class Fight < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_many :weapons, dependent: :destroy
end
