class Manager::CustomersController < ApplicationController
  def index
    @customers = current_user.customers
  end

  def new
    @customer = current_user.customers.build
  end

  def create
    debugger
    @customer = current_user.customers.build(customer_params)
    @customer.save!
  end

  def customer_params
    params.require(:user).permit(:name, :account, :password, :kind)
  end
end
