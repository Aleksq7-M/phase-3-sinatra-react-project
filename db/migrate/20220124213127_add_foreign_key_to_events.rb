class AddForeignKeyToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :timeline_id, :integer
  end
end
