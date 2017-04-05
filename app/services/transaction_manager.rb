class TransactionManager
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def do_transaction(transaction, account_target = nil)
    Transaction.transaction do
      begin
        case transaction.kind
        when 'withdraw'
          user.balance.subtract(transaction.amount)
        when 'deposit'
          user.balance.add(transaction.amount)
        when 'transfer'
          user_target = User.find_by(account: account_target)
          user.balance.subtract(transaction.amount)
          user_target.balance.add(transaction.amount)
          transaction.user_target = user_target
        end
        transaction.save
        OpenStruct.new(success?: true, object: transaction, message: "Transação efetuada com sucesso.")
      rescue => e
        OpenStruct.new(success?: false, object: nil, message: e.to_s)
      end
    end
  end

end
