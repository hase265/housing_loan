class ChangeDateTypeToCalculations < ActiveRecord::Migration[5.1]
  def change
    change_column :calculations, :time_to_check, :date
  end
end
