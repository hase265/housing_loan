class CalculationService
  attr_reader :loan_amount, :borrowing_month, :interest_rate

  def initialize(loan_amount:, borrowing_month:, interest_rate:)
    @loan_amount = loan_amount.to_f
    @borrowing_month = borrowing_month.to_f
    @interest_rate = interest_rate.to_f
  end

  def call
    r = interest_rate/12/100
    s = loan_amount
    n = borrowing_month
    (r * s * (1 + r) ** n / ((1 + r) ** n - 1)).round(2)
  end
end
