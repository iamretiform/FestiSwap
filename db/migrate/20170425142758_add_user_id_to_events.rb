class AddUserIdToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :user_id, :integer, null: false, on_delete: :cascade
  end
end
