class AddLecturerToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :lecturer, :boolean
  end
end
