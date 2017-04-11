class BalanceManager
  def self.extract(user, start_at = DateTime.current.beginning_of_month, end_at = DateTime.current)
    extract = user.balance.transactions.where(created_at: start_at..end_at).map do |transaction|
      type = 'D' if transaction.kind.eql?('withdraw') || transaction.kind.eql?('transfer') || transaction.kind.eql?('tax')
      type = 'C' if transaction.kind.eql?('deposit')
      OpenStruct.new(type: type, amount: transaction.amount, done_at: transaction.created_at, description: transaction.kind)
    end

    user.transactions_for_me.where(created_at: start_at..end_at).each do |transaction|
      extract << OpenStruct.new(type: type, amount: transaction.amount, done_at: transaction.created_at, description: transaction.kind)
    end

    user.investment_portfolios.where(created_at: start_at..end_at).each do |investment|
      extract << OpenStruct.new(type: 'D', amount: investment.amount, done_at: investment.created_at, description: 'Investimento')
      extract << OpenStruct.new(type: 'C', amount: investment.amount, done_at: investment.created_at, description: 'Investimento') if investment.purchased?
    end

    user.manager_visits.where(created_at: start_at..end_at).each do |visit|
      extract << OpenStruct.new(type: 'D', amount: visit.amount, done_at: visit.created_at, description: 'Visita do Gerente')
    end
    extract.sort_by(&:done_at)# { |el| el[:done_at] }
  end

end
