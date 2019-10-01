class Blog < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :spree_user, optional: true
end
