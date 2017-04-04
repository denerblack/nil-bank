class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new(kind: params[:kind])
  end

  def create
    @transaction = Transaction.new(transaction_params)
    result = transaction_manager.do_transaction(@transaction)
    if result.success?
      flash[:notice] = result.message
    else
      flash[:danger] = result.message
    end
    redirect_to transaction_new_url(transaction_params[:kind])
  end

  private

  def transaction_manager
    @transaction_manager ||= TransactionManager.new(current_user)
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :kind)
  end
end
