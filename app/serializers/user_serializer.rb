class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :full_name, :email

  #def id
    #object.id
  #end
  #
  # def created_at
  #   object.created_at.strftime('%B %d, %Y')
  # end
  #
  # def full_name
  #   object.full_name
  # end
  #
  # def email
  #   object.email
  # end
end
