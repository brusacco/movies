class Movie < ApplicationRecord
  validates_presence_of :title, :uid, :popularity, :adult
end
