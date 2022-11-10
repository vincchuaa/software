class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :groupCode
      t.string :title
      t.string :groupSet
      t.integer :groupSize
      t.integer :unwantedMembers
      t.datetime :deadline
      t.string :groupMembers , default:""
      t.string :moduleCode
      t.integer :score , default:0
      t.boolean :final , default:false
      t.boolean :updated , default:false
      
      t.timestamps
    end
  end
end
