class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id

  has_one :movie
end
