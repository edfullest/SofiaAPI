class CoursesPeople < ApplicationRecord
    belongs_to :student, class_name: "Person", foreign_key: :person_id
    belongs_to :course
end
