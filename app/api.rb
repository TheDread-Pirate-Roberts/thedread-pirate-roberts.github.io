require 'net/http'
require 'uri'

class Api
  class << self
    attr_accessor :weather

    def curl_weather
    uri = URI.parse("https://api.darksky.net/forecast/d83d1a58023425b06667a532bec2d083/37.8267,-122.4233")
    request = Net::HTTP::Get.new(uri)
    request["Connection"] = "keep-alive"
    request["Cache-Control"] = "max-age=0"
    request["Upgrade-Insecure-Requests"] = "1"
    request["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36"
    request["Accept"] = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8"
    request["Accept-Language"] = "en-US,en;q=0.9,ca;q=0.8"
    request["Cookie"] = "_ga=GA1.2.313591408.1526520884; _gid=GA1.2.552583087.1526520884; latlon=40.7127%2C-74.0059"
    
    req_options = {
      use_ssl: uri.scheme == "https",
    }
    
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    # response.code
    response.body
    end

  end
end
