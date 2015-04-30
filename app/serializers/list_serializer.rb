class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :created_at, :public
end
