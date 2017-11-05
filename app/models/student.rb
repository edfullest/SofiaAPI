class Student < Person

    # --Relation name in DataModel: Course <<has_students>>
    # --Association with Course: many to many relationship with Course.
    has_and_belongs_to_many :courses


    # --Relation name in DataModel: Student <<student_does>> Assignment 
    # --Association with Assignment: many to many relationship with Assignment THROUGH Courses.
    has_many :assignments, :through => :courses
end