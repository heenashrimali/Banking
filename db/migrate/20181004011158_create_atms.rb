class CreateAtms < ActiveRecord::Migration[5.2]
  def change
    create_table :atms do |t|
      t.string :location
      t.string :managed_by
      t.references :bank , index: true, foreign_key: true
    end
  end
end
