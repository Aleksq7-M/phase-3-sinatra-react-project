class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :event_start
      t.integer :event_end
      t.string :event_name
      t.string :event_location
      t.boolean :recurring
    end
  end
end
