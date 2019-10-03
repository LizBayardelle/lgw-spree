class Profile < ApplicationRecord
  belongs_to :spree_user, optional: true
  has_one_attached :avatar

  def full_name
    "#{first_name} #{last_name}"
  end
end
