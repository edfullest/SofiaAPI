class CreateJoinTableCourseStudent < ActiveRecord::Migration[5.1]
  def change
    create_table :courses_people do |t|
      t.references :course, foreign_key: true
      t.references :person, foreign_key: true
      t.float :grade
    end
    # Rails needs a primary key to delete associated records, see:
    # https://github.com/rails/rails/issues/20755
    # add_index :courses_people, :registration_id
    add_index :courses_people, [ :course_id, :person_id ], :unique => true, :name => 'by_course_and_person'
  end
end



