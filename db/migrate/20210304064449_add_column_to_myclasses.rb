class AddColumnToMyclasses < ActiveRecord::Migration[6.1]
  def change
    add_column :myclasses, :week, :string, default: "", null: false
    add_column :myclasses, :time, :integer, default: 0, null: false
  end
end
