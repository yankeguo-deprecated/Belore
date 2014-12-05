json.array!(@posts) do |post|
  json.extract! post, :id, :is_published
  json.url post_url(post, format: :json)
end
