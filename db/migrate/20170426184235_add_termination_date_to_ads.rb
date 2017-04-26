class AddTerminationDateToAds < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :termination_date, :datetime
  end
end
