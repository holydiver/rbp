require "json"
require "open-uri"
require "cgi"


module GSearch
  extend self

  API_BASE_URI = 
    "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q="

  def show_results(query)
    results = response_data(query)
    results["responseData"]["results"].each do |match|
      puts CGI.unescapeHTML(match["titleNoFormatting"]) + ":\n " + match["url"]
    end
  end

  def response_data(query)
    data = open(API_BASE_URI + URI.escape(query),
                   "Referer" => "http://rubybestpractices.com").read
    JSON.parse(data)
  end

end
