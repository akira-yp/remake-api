class CreateAssigns < ActiveRecord::Migration[6.0]
  def change
    create_table :assigns do |t|
      t.text :description
      t.integer :badget
      t.integer :status
      t.integer :owner_id, index: true
      t.integer :designer_id, index: true

      t.timestamps
    end
    add_foreign_key :assigns, :users, column: :owner_id
    add_foreign_key :assigns, :users, column: :designer_id
  end
end
