class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :payer_id
      t.integer :ower_id
      t.integer :event_id
      t.string :amount

      t.timestamps

    end
  end
end
