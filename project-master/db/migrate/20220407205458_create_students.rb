class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :forename
      t.string :middlename
      t.string :surname
      t.string :username
      t.string :feeStatus
      t.string :programme
      t.string :gender
      
      t.timestamps
    end
  end
end
