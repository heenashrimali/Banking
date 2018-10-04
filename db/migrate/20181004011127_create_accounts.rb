class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
    	t.string :type
    	t.string :doo
    	t.integer :account_no
    	t.float :balance
    	t.references :customer, index: true, foreign_key: true
    	t.references :bank , index:true , foreign_key:true
    end
  end
end
