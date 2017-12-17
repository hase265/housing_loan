class CalculationsController < ApplicationController
  def index
  end

  def result
    @result = CalculationService.new(
      loan_amount: params[:loan_amount],
      borrowing_month: params[:borrowing_month],
      interest_rate: params[:interest_rate]
    ).call
  end
end
