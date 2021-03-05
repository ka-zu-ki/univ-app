class CreateMyclasses < ActiveRecord::Migration[6.1]
  def change
    create_table :myclasses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.string :name, :null => false, comment: "講義名"
      t.string :professor, :null => false, comment: "教授名"
      t.string :week, :null => false, comment: "曜日"
      t.integer :time, :null => false, comment: "時限"
      t.integer :room, :null => false, comment: "教室番号"
      t.text :content, :null => false, comment: "講義内容"
      t.boolean :active, null: false
      t.timestamps
    end
  end
end
