class BalanceManager
  def self.extract(user, start_at = DateTime.current.beginning_of_month, end_at = DateTime.current)
    extract = user.transactions.where(created_at: start_at..end_at).map do |transaction|
      type = 'D' if transaction.kind.eql?('withdraw') || transaction.kind.eql?('transfer') || transaction.kind.eql?('tax')
      type = 'C' if transaction.kind.eql?('deposit')
      {
        type: type,
        amount: transaction.amount,
        done_at: transaction.created_at
      }
    end

    user.transactions_for_me.where(created_at: start_at..end_at).each do |transaction|
      extract << {
        type: 'C',
        amount: transaction.amount,
        done_at: transaction.created_at
      }
    end

    user.investment_portfolios.where(created_at: start_at..end_at).each do |investment|
      extract << {
        type: 'D',
        amount: investment.purchase_price * investment.quantity,
        done_at: investment.created_at
      }
      extract << {
        type: 'C',
        amount: investment.sale_price * investment.sale_quantity,
        done_at: investment.created_at
      } if investment.purchased?
    end

    user.manager_visits.where(created_at: start_at..end_at).each do |visit|
      extract << {
        type: 'D',
        amount: visit.amount,
        done_at: visit.created_at
      }
    end
    extract.sort_by { |el| el[:done_at] }
  end

end
