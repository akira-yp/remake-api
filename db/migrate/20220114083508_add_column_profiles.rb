class AddColumnProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :orderable, :boolean, default: false
  end
end
