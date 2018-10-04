class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :address
      t.string :designation
      t.date :date_of_joining
      t.integer :age
      t.integer :contact_no
      t.float :salary
      t.references :branch, index: true, foreign_key: true
    end
  end
end
