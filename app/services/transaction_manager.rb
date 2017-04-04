class TransactionManager
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def do_transaction(transaction)
    Transaction.transaction do
      begin
        case transaction.kind
        when 'withdraw'
          user.balance.subtract(transaction.amount)
        end
        transaction.save
        OpenStruct.new(success?: true, object: transaction, message: "Transação efetuada com sucesso.")
      rescue => e
        OpenStruct.new(success?: false, object: nil, message: e.to_s)
      end
    end
  end

end
