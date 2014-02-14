class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :subject_id

      t.timestamps
    end
    add_index :tags, [:subject_id]
  end
end
