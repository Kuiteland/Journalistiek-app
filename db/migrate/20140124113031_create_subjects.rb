class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :short_description
      t.string :description
      t.string :red
      t.string :reg
      t.string :host
      t.string :status

      t.timestamps
    end
  end
end
