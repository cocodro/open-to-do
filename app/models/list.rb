class List < ActiveRecord::Base
  belongs_to :user

  def public?
    self.public
  end
end
