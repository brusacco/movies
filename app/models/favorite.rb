class Favorite < ApplicationRecord
  validates_presence_of :movie, :user
  validates_uniqueness_of :movie, scope: :user

  belongs_to :movie
  belongs_to :user
end
