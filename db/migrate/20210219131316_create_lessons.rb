class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :name, :null => false, comment: "講義名"
      t.string :professor, :null => false, comment: "教授名"
      t.string :period, :null => false, comment: "時限"
      t.integer :room, :null => false, comment: "教室番号"
      t.text :content, :null => false, comment: "講義内容"
      t.timestamps
    end
  end
end
