class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :description
      t.references :assignment, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
