class Student < Person

    # --Relation name in DataModel: Course <<has_students>>
    # --Association with Course: many to many relationship with Course.
    # has_and_belongs_to_many :courses, :class_name => "Course", :join_table => "courses_people", :association_foreign_key => "course_id"
    has_and_belongs_to_many :courses, :through => :courses_people, foreign_key: :person_id


    # --Relation name in DataModel: Student <<student_does>> Assignment 
    # --Association with Assignment: many to many relationship with Assignment THROUGH Courses.
    has_many :assignments, :through => :courses
end