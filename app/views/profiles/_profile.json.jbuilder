json.extract! profile, :id, :spree_user_id, :first_name, :last_name, :can_blog, :created_at, :updated_at
json.url profile_url(profile, format: :json)
