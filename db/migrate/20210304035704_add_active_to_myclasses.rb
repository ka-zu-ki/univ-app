class AddActiveToMyclasses < ActiveRecord::Migration[6.1]
  def change
    add_column :myclasses, :active, :boolean, default: false, null: false
  end
end
