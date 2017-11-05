json.extract! answer, :id, :is_correct, :description, :question_id, :created_at, :updated_at
json.url answer_url(answer, format: :json)
