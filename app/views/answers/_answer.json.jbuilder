json.extract! answer, :id, :question_id, :content, :right, :created_at, :updated_at
json.url answer_url(answer, format: :json)
