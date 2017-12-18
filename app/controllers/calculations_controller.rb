class CalculationsController < ApplicationController
  def index; end

  def result
    # calculationメソッドという名前では他の計算機能を足す時に被ってしまうかもしれないので、
    # resultに変更
    # controllerでクライアントとのやりとり、serviceで、内部の処理というように分担
    @result = CalculationService.new(
      loan_amount: params[:loan_amount],
      borrowing_month: params[:borrowing_month],
      interest_rate: params[:interest_rate],
      time_to_check: params[:time_to_check]
    ).call
  end
end
