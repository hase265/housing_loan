class CreateCalculations < ActiveRecord::Migration[5.1]
  def change
    create_table :calculations do |t|
      t.integer :borrowing, null: false
      t.integer :borrowing_period, null: false
      t.integer :interest_rate, null: false
      t.datetime :time_to_check

      t.timestamps
    end
  end
end
