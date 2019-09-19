class Candidate < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :name, :popularity_points, :attack_strength, :photo, presence: true
  validates :popularity_points, numericality: { greater_than: 10, less_than: 100 }
  validates :attack_strength, numericality: { greater_than: 0, less_than: 20 }
end
