class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :address
      t.integer :code
      t.integer :phone_no
      t.references :bank, index: true, foreign_key: true
    end
  end
end
