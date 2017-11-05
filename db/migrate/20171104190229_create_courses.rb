class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.float :rating
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
