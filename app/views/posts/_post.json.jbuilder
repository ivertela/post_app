json.extract! post, :id, :title, :description, :aasm_state, :created_at, :updated_at
json.url post_url(post, format: :json)
