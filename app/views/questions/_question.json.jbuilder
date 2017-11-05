json.extract! question, :id, :description, :assignment_id, :type, :created_at, :updated_at
json.url question_url(question, format: :json)
