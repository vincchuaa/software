class AddCurrentModuleToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :currentModule, :string
  end
end
