class RenameBorrowingPeriodColumnToCalculations < ActiveRecord::Migration[5.1]
  def change
    rename_column :calculations, :borrowing_period, :borrowing_month
    rename_column :calculations, :borrowing, :loan_amount
  end
end
