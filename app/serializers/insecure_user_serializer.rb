class InsecureUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :full_name

  def id
    object.id
  end

  def email
    object.email
  end

  def password
    object.password
  end

  def full_name
    object.full_name
  end
end
