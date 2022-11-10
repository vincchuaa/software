class CreateLecturers < ActiveRecord::Migration[6.1]
  def change
    create_table :lecturers do |t|
      t.string :email
      t.boolean :senior
      t.string :modules
      t.string :currentGroupSet
      t.string :currentTeam
      
      t.timestamps
    end
  end
end
