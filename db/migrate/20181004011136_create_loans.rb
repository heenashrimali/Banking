class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
    	t.string :type
        t.date :date
    	t.float :amount
    	t.float :rate
    	t.float :time_period
    	t.references :customer, index: true, foreign_key: true
    	t.references :bank, index: true, foreign_key: true
    end
  end
end
