class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :brand
      t.string :category
      t.integer :condition
      t.string :sizing
      t.integer :status, default: 0
      t.integer :sex
      t.boolean :forsale, default: false, null: false

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
