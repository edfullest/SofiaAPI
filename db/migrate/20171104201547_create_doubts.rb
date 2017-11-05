class CreateDoubts < ActiveRecord::Migration[5.1]
  def change
    create_table :doubts do |t|
      t.text :question
      t.text :answer
      t.references :assignment, foreign_key: true

      t.timestamps
    end
  end
end
