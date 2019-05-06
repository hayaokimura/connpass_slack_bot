require 'net/http'
require 'uri'
require 'json'

class ConnpassAPI 
  def self.search(count = 10, keyword)
    uri = URI.parse("https://connpass.com/api/v1/event/?order=2&count=#{count}&keyword=#{keyword}")
    res = Net::HTTP.get(uri)
    events = JSON.parse(res)["events"]
  end
end