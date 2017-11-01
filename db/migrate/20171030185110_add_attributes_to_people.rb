class AddAttributesToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :type, :string
    add_column :people, :last_name, :string
    add_column :people, :age, :integer
  end
end
