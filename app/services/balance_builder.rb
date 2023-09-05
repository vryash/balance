class BalanceBuilder
  attr_reader :user, :error

  def initialize; end

  def perform(balance, start_date, end_date)
    OpenStruct.new(start_date: start_date, end_date: end_date, balance: balance).marshal_dump
  end

  def error
    @error ||= []
  end
end
