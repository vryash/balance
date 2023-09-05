class BalanceChanger
  attr_reader :user, :errors

  def initialize(user)
    @user = user
  end

  def perform(operator, num)
    operator, num = normalize_params(operator, num)

    return self if errors.any?

    change_balance(operator, num)

    self
  end

  def change_balance(operator, num) 
    user.with_lock {
      user.balance = user.balance.send(operator, num)

      errors << 'negative balance' and return if user.balance < 0

      user.invoices.build(amount: num, operator: operator)

      user.save!
    }
  end

  def normalize_params(operator, num)
    operator, num = Invoice::OPERATORS[operator.to_sym], num.to_i
    
    errors << 'wrong operator or num' unless operator && num

    return operator, num
  end

  def errors
    @errors ||= []
  end
end
