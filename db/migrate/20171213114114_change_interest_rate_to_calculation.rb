class ChangeInterestRateToCalculation < ActiveRecord::Migration[5.1]
  def change
    change_column :calculations, :interest_rate, :float
  end
end
