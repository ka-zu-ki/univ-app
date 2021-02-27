class CreateMyclasses < ActiveRecord::Migration[6.1]
  def change
    create_table :myclasses do |t|
      t.references :user, :null => false, foreign_key: true
      t.references :lesson, :null => false, foreign_key: true
      t.timestamps
    end
  end
end
