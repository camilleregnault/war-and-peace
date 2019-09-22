class Candidate < ApplicationRecord
  has_many :fights
  mount_uploader :photo, PhotoUploader
  validates :name, :popularity_points, :attack_strength, :photo, presence: true
  validates :popularity_points, numericality: { greater_than: 30, less_than: 101 }
  validates :attack_strength, numericality: { greater_than: 9, less_than: 26 }
end
