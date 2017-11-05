class CreateJoinTableCourseStudent < ActiveRecord::Migration[5.1]
  def change
    create_join_table :Courses, :People do |t|
      t.index [:course_id, :person_id]
      t.index [:person_id, :course_id]
      t.float :rating
    end
  end
end
