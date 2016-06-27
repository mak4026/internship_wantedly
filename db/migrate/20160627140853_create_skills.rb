class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :skills, [:name], unique: true
  end
end
