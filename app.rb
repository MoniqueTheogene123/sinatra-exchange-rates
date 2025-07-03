# /app.rb

require "sinatra"
require "sinatra/reloader"

# Pull in the HTTP class
require "http"

# define a route for the homepage
get("/") do
  @raw_response = HTTP.get("https://api.exchangerate.host/list?access_key=3f7fcf1d090548ea5f5ab1de8c9c6a4f")

  @string_response = @raw_response.to_s

  @parsed_response = JSON.parse(@string_response)
  
  @currencies = @parsed_response.fetch("currencies")

  erb(:homepage)
end


# https://exchange-rates.matchthetarget.com/margo


# get("/:from_currency") do
#   @from_currency = params.fetch("from_currency")

#   api_url = "https://api.exchangerate.host/list?access_key=3f7fcf1d090548ea5f5ab1de8c9c6a4f"
# puts "api_url, #{api_url}"

#   raw_response = HTTP.get(api_url)

#   string_response = raw_response.to_s

#   parsed_response = JSON.parse(string_response)
  
#   @currencies = parsed_response.fetch("currencies")

#   erb(:from_currency)
# end


# get("/:from_currency/:to_currency") do
#   @original_currency = params.fetch("from_currency")
#   @destination_currency = params.fetch("to_currency")

#   @api_url = "https://api.exchangerate.host/convert?from=#{from_currency}&to=#{to_currency}&amount=1&access_key=3f7fcf1d090548ea5f5ab1de8c9c6a4f"

#   @raw_response = HTTP.get(@api_url)
  
#   @string_response = @raw_response.to_s

#   @parsed_response = JSON.parse(@string_response)
  
#   @amount = @parsed_response.fetch("result")
  
#   erb(:to_currency)
# end
