json.extract! blog, :id, :title, :teaser, :body, :published, :published_at, :featured_image_url, :user_id, :pin_1_url, :pin_2_url, :pin_3_url, :pin_4_url, :created_at, :updated_at
json.url blog_url(blog, format: :json)
