class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :number
      t.integer :subject_id

      t.timestamps
    end
    add_index :contacts, [:subject_id]
  end
end
