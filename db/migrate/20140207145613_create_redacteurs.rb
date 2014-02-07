class CreateRedacteurs < ActiveRecord::Migration
  def change
    create_table :redacteurs do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
