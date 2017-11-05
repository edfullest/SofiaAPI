class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.float :rating
      t.string :type
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
