class CalculationService
  attr_reader :loan_amount, :borrowing_month, :interest_rate, :time_to_check

  def initialize(loan_amount:, borrowing_month:, interest_rate:, time_to_check:)
    @loan_amount = loan_amount.to_i
    @borrowing_month = borrowing_month.to_i
    @interest_rate = interest_rate.to_f
    # 年と月だけ受け取ったtime_to_checkを日まで加えて、数値の配列に変換
    # [2018-01]を受け取ったら、[2018, 01, 01]という配列に変換
    @time_to_check = "#{time_to_check}-01".split('-').map(&:to_i)
  end

  def call
    r = @interest_rate/12/100
    s = @loan_amount
    n = @borrowing_month
    # 借入期間からmonths_diffを引き、残りの期間を算出
    t = n - months_diff
    if @today_months + n < @someday_months
      return '求めたい残債期間より後に借入期間をセットしてください'
    elsif @today_months > @someday_months
      return '今日より後の月をセットしてください'
    else
      (t * r * s * (1 + r) ** n / ((1 + r) ** n - 1)).round(2)
    end
  end

  def months_diff
    today = Date.today
    # [2018, 01, 01]といった配列をdate型に変換してsomedayに入れる
    someday = Date.new(@time_to_check[0], @time_to_check[1], @time_to_check[2])
    # 1年を12ヶ月に直し、月の差分を出す
    @today_months = today.year * 12 + today.month
    @someday_months = someday.year * 12 + someday.month
    @someday_months - @today_months + 1
  end
end
