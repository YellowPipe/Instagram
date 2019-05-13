json.extract! profile_description, :id, :name, :body, :user_id, :created_at, :updated_at
json.url profile_description_url(profile_description, format: :json)
