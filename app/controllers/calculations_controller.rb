class CalculationsController < ApplicationController
  def index
    @calculation = Calculation.new
  end

  def create
    Calculation.new(calculation_params).save
    redirect_to :result_calculations
  end

  def calculate
    data = Calculation.last
    r = data.interest_rate/12/100
    s = data.loan_amount
    n = data.borrowing_month
    @result = (r * s * (1 + r) ** n / ((1 + r) ** n - 1)).round(2)
  end

  private
  def calculation_params
    params.require(:calculation).permit(
      :loan_amount, :borrowing_month, :interest_rate
    )
  end
end
