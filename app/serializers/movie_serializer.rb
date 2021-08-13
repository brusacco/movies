class MovieSerializer < ActiveModel::Serializer
  attributes :id, :uid, :title, :popularity
end
