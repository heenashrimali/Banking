class CreateTransations < ActiveRecord::Migration[5.2]
  def change
    create_table :transations do |t|
      t.string :operation
      t.date :date
      t.integer :amount
      t.references :account , index: true, foreign_key: true
      t.references :atm ,index: true, foreign_key: true
      t.references :branch ,index: true, foreign_key: true
    end
  end
end
