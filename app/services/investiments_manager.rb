class InvestimentsManager
  URI = URI("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quote%20where%20symbol%20in%20(%22BVMF3.SA%22%2C%22MULT3.SA%22%2C%22PETR4.SA%22%2C%20%22VALE5.SA%22%2C%20%22BRML3.SA%22%2C%20%22ALSC3.SA%22%2C%20%22BBAS3.SA%22%2C%20%22ITSA4.SA%22)&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")

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
