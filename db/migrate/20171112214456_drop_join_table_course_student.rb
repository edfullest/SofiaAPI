class DropJoinTableCourseStudent < ActiveRecord::Migration[5.1]
  def change
    drop_join_table :Courses, :People
  end
end
