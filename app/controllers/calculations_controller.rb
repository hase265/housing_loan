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
    @result = (data.borrowing * data.borrowing_period * data.interest_rate).round
  end

  private
  def calculation_params
    params.require(:calculation).permit(
      :borrowing, :borrowing_period, :interest_rate
    )
  end
end
