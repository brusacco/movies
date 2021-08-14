class Movie < ApplicationRecord
  validates_presence_of :title, :uid, :popularity
  validates_uniqueness_of :uid

  has_many :favorites, dependent: :destroy

  scope :ordered_by_popular, -> { order(popularity: :desc) }
end
