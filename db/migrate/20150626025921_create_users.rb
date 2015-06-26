class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :nick_name
      t.integer :job_type
      t.integer :emp_number
      t.text :self_introduction
      t.string :icon
      t.boolean :admin, default: false

      t.timestamps null: false
    end

    add_index :users, [:full_name, :nick_name], unique: true
    add_index :users, :nick_name,               unique: true
  end
end
