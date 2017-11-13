class Assignment < ApplicationRecord

  # --Relation name in DataModel: Course <<provides>> assignments
  # --Association with Assignment: Belongs to ONLY ONE Course.
  belongs_to :course
  
  # --Relation name in DataModel: Student <<student_does>> Assignment 
  # --Association with Assignment: many to many relationship with Student THROUGH Courses.
  has_many :students, :through => :courses

  # --Relation name in DataModel: Doubt <<clarifies>> Assignment 
  # --Association with Assignment: 1 to many relationship with Assignment.
  has_many :doubts

  # --Relation name in DataModel: Assignment <<asks>> Questions. 
  # --Association with Question: 1 to many relationship with Question.
  has_many :questions, dependent: :destroy

  def self.type
      %w(Quiz Exam Homework Activity)
  end

  scope :quizzes, -> { where(type: 'Quiz') } 
  scope :exams, -> { where(type: 'Exam') } 
  scope :homeworks, -> { where(type: 'Homework') } 
  scope :activities, -> { where(type: 'Activity') } 


end
