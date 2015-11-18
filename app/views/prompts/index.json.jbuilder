json.array!(@prompts) do |prompt|
  json.extract! prompt, :id, :user_id, :text, :prompt_type, :active
  json.url prompt_url(prompt, format: :json)
end
