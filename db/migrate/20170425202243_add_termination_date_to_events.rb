class AddTerminationDateToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :termination_date, :datetime, null: false
  end
end
