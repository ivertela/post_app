json.extract! user, :id, :name, :email, :posted_post_count , :deleted_at, :created_at, :updated_at
json.url user_url(user, format: :json)
