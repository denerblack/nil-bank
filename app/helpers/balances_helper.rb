module BalancesHelper
  def item_amount_extract(amount, type)
    currency = number_to_currency(amount, unit: "R$ ", separator: ",", delimiter: ".")
    return currency if type.eql?('C')
    "(-#{currency})"
  end
end
