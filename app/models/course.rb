class Course < ApplicationRecord
  
  # --Relation name in DataModel: Course <<has_teachers>>
  # --Association with Teacher: Belongs to ONLY ONE Teacher
  belongs_to :teacher, class_name: "Person", foreign_key: :person_id
  
  # --Relation name in DataModel: Course <<has_students>>
  # --Association with Student: many to many relationship with Student.
  # has_and_belongs_to_many :students, foreign_key: :person_id, :through => :courses_people, foreign_key: :course_id
  has_and_belongs_to_many :students, :class_name => "Person", :join_table => "courses_people", :association_foreign_key => "person_id", dependent: :destroy

  # --Relation name in DataModel: Course <<provides>> assignments
  # --Association with Assignment: 1 to many relationship with Assignment.
  has_many :assignments, dependent: :destroy
end
