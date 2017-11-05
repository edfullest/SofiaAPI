class Answer < ApplicationRecord
  # --Relation name in DataModel: Questions <<has>> Answers. 
  # --Association with Question: An belongs to ONLY ONE question
  belongs_to :question

  
end
