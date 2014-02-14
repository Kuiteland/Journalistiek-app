class CreateRegisseurs < ActiveRecord::Migration
  def change
    create_table :regisseurs do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
