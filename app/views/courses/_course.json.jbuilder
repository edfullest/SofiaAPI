json.extract! course, :id, :name, :start_date, :end_date, :rating, :created_at, :updated_at
json.teacher_id course.person_id
json.url course_url(course, format: :json)
