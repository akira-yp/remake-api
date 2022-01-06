class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :assign, foreign_key: true

      t.timestamps
    end
  end
end
