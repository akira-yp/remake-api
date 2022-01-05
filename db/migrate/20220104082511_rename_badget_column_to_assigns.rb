class RenameBadgetColumnToAssigns < ActiveRecord::Migration[6.0]
  def change
    rename_column :assigns, :badget, :budget
  end
end
