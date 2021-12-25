class RemoveProfileFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :profile, :text
    remove_column :users, :description, :text
  end
end
