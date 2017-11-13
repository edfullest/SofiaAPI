class Question < ApplicationRecord

  # --Relation name in DataModel: Assignment <<asks>> Questions. 
  # --Association with Assignment: A question belongs to ONLY ONE Assignment
  belongs_to :assignment

  # --Relation name in DataModel: Question <<has>> Answers. 
  # --Association with Answer: 1 to many relationship with Answer.
  has_many :answers, dependent: :delete_all

  def self.type
      %w(BlankFill MultipleChoice)
  end

  scope :blankfills, -> { where(type: 'BlankFill') } 
  scope :multiplechoices, -> { where(type: 'MultipleChoice') } 
end
