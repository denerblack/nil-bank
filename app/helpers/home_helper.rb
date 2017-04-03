module HomeHelper
  def balance
    number_to_currency(@balance, unit: "R$", separator: ",", delimiter: ".")
  end
end
