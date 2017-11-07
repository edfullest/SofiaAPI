class Person < ActiveRecord::Base
  # Include default devise modules.
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable
    include DeviseTokenAuth::Concerns::User

    def self.type
      %w(Student Teacher)
    end

    scope :students, -> { where(type: 'Student') } 
    scope :teachers, -> { where(type: 'Teacher') } 

    # --Relation name in DataModel: Course <<has_teachers>> 
    # --Association with Course: 1 to many relationship with Course.
    # has_many :courses
end
