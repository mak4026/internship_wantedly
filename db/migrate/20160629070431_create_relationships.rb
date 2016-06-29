class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :skill_id
      t.integer :user_id
      t.integer :adder_id

      t.timestamps null: false
    end
    add_index :relationships, :user_id
    add_index :relationships, [:user_id, :skill_id]
    add_index :relationships, [:user_id, :skill_id, :adder_id], unique:true
  end
end
