class CreatePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :preferences do |t|
      t.string :username
      t.string :groupSet
      t.string :groupCode
      t.string :partners
      t.string :nonPartners
      t.string :feeStatus
      t.string :gender
      t.string :full_name
      t.string :moduleCode
      t.boolean :filled
      
      t.timestamps
    end
  end
end
