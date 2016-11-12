class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_description
      t.string :total_cost

      t.timestamps

    end
  end
end
