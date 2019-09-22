class Fight < ApplicationRecord
  has_many :candidates, dependent: :destroy
end
