require 'net/http'

class InvestimentsManager
  URI = URI("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quote%20where%20symbol%20in%20(%22BVMF3.SA%22%2C%22MULT3.SA%22%2C%22PETR4.SA%22%2C%20%22VALE5.SA%22%2C%20%22BRML3.SA%22%2C%20%22ALSC3.SA%22%2C%20%22BBAS3.SA%22%2C%20%22ITSA4.SA%22)&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")


  def self.user_investments(user)
    quotes = quotations
    user.investment_portfolios.each do |investment|
      investment.sale_price ||= quotes.find {|quote| quote["symbol"] == investment.action}["LastTradePriceOnly"]
    end
  end

  def self.purchase(params)
    InvestmentPortfolio.transaction do
      params.select { |invest| invest[:quantity].to_i > 0}.each do |investment|
        InvestmentPortfolio.create(investment)
      end
    end
  end

  def self.sale(params, user)
    InvestmentPortfolio.transaction do
      investment = InvestmentPortfolio.update(params[:id], params)
      total = investment.sale_quantity * investment.sale_price + 1.5
      user.balance.add(total)
      pay = total * 0.5 / 100
      [pay, 1.5].each do |tax|
        user.transactions.create(amount: tax, kind: :tax)
        user.balance.subtract(tax)
      end
    end
  end

  def self.quotations
    request = Net::HTTP::Get.new(URI)
    http = Net::HTTP.new(URI.hostname, URI.port)
    http.use_ssl = true if URI.scheme == 'https'

    response = http.start do |h|
      h.request(request)
    end
    Hash.from_xml(response.body)["query"]["results"]["quote"]
  end
end
