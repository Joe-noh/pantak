class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :diary_id
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :comments, [:diary_id]
    add_index :comments, [:user_id]
    add_index :comments, [:diary_id, :user_id]
  end
end
