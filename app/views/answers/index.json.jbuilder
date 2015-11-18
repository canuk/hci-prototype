json.array!(@answers) do |answer|
  json.extract! answer, :id, :user_id, :prompt_id, :choice_id, :text
  json.url answer_url(answer, format: :json)
end
