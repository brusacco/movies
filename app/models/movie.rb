class Movie < ApplicationRecord
  validates_presence_of :title, :uid, :popularity, :adult
  validates_uniqueness_of :uid

  has_many :favorites, dependent: :destroy
end
