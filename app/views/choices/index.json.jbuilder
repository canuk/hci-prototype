json.array!(@choices) do |choice|
  json.extract! choice, :id, :user_id, :prompt_id, :text, :order
  json.url choice_url(choice, format: :json)
end
