class AddDateToSubjects < ActiveRecord::Migration
  def change
  	add_column :subjects, :air_date, :date
  end
end
