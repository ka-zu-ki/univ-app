class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :myclass, null: false, foreign_key: true
      t.string :name, null: false
      t.boolean :is_completed, default: false

      t.timestamps
    end
  end
end
