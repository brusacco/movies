class Favorite < ApplicationRecord
  validates_presence_of :movie, :user
  belongs_to :movie
  belongs_to :user
end
