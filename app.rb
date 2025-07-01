# /app.rb

require "sinatra"
require "sinatra/reloader"

# Pull in the HTTP class
require "http"

# define a route for the homepage
get("/") do


    @raw_response = HTTP.get("https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY")}")
    puts "my env exchange rate key: #{ENV.fetch("EXCHANGE_RATE_KEY")}"

    @string_response = @raw_response.to_s
    @parsed_response = JSON.parse(@string_response)
    @currencies = @parsed_response.fetch("currencies")

    puts @raw_response
  erb(:homepage)
end


# get("/:from_currency") do
#   @original_currency = params.fetch("from_currency")

#   api_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY")}"
  
#   # Some more code to parse the URL and render a view template.
#   # (HINT: this code is identical to the first route, you just
#   # render a different view template at the end.)
# end

# get("/:from_currency/:to_currency") do
#   @original_currency = params.fetch("from_currency")
#   @destination_currency = params.fetch("to_currency")

#   api_url = "https://api.exchangerate.host/convert?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY")}&from=#{@original_currency}&to=#{@destination_currency}&amount=1"
  
#   # Some more code to parse the URL and render a view template.
# end
