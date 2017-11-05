class Doubt < ApplicationRecord

  # --Relation name in DataModel: Doubt <<clarifies>> Assignment 
  # --Association with Assignment: A doubt belongs to ONLY ONE Assignment.
  belongs_to :assignment
end
