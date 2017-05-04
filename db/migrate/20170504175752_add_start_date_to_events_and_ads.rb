class AddStartDateToEventsAndAds < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :start_date, :datetime
    add_column :ads, :start_date, :datetime
  end
end
