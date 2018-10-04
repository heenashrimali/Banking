class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
    	t.string :name
    	t.string :marital_status
    	t.string :address
        t.date :dob
        t.integer :age
    	t.integer :contact_no
    	t.references :branch, index: true, foreign_key: true
    end
  end
end
