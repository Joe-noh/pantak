class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.integer :user_id
      t.string :title
      t.text :content

      t.timestamps null: false
    end

    add_index :diaries, [:user_id, :created_at]
  end
end
