class AddModulesToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :modules, :string
  end
end
