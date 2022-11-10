class CreatePairings < ActiveRecord::Migration[6.1]
  def change
    create_table :pairings do |t|
      t.string :groupCode
      t.string :groupSet
      t.string :username_a
      t.string :username_b
      t.string :name_a
      t.string :name_b

      
      t.timestamps
    end
  end
end
