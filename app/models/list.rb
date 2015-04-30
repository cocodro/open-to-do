class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  def public?
    self.public
  end
end
