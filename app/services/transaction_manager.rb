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
          do_transfer(transaction, account_target)
        end
        transaction.save
        OpenStruct.new(success?: true, object: transaction, message: "Transação efetuada com sucesso.")
      rescue => e
        OpenStruct.new(success?: false, object: nil, message: e.to_s)
      end
    end
  end

  private

  def do_transfer(transaction, account_target)
    raise "Não pode fazer uma transferência maior que 1000,00" if transaction.amount > 1000 && user.normal?
    user_target = User.find_by(account: account_target)
    raise "Conta destino não existe" unless user_target
    user.balance.subtract(transaction.amount)
    tax = user.normal? ? 8.0 : (transaction.amount * 0.8/100).round(2)
    Transaction.create(amount: tax, kind: :tax)
    user.balance.subtract(tax)
    user_target.balance.add(transaction.amount)
    puts user_target.balance.amount
    transaction.user_target = user_target
  end

end
