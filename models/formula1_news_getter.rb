require './lib/api_caller'
require 'json'

class Formula1NewsGetter
  API_KEY = 'f2c68cf2cc8c4df9bced4411d7c70af1'
  ROOT_URL = "https://newsapi.org/v2/everything"
  PARAMS = {
    qInTitle: "formula+1",
    from: "2019-12-01",
    sortBy: "publishedAt",
    language: "en",
    domains: "autosport.com,bbc.co.uk,nzherald.co.nz,firstpost.com",
    apiKey: API_KEY
  }

  def news
    call = ApiCaller.new(api_url)
    JSON.parse(call.get)
  end

  def articles
    news["articles"]
  end

  private

  def api_url
    url = "#{ROOT_URL}?"
    PARAMS.each do |key, value|
      url += "#{key}=#{value}&"
    end
    url[0..-2]
  end
end
