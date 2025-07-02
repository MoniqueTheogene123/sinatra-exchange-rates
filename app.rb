# /app.rb

require "sinatra"
require "sinatra/reloader"

# Pull in the HTTP class
require "http"

# define a route for the homepage
get("/") do
  @raw_response = HTTP.get("https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY").chomp}")

  @string_response = @raw_response.to_s

  @parsed_response = JSON.parse(@string_response)
  
  @currencies = @parsed_response.fetch("currencies")

  erb(:homepage)
end

get("/:first_symbol") do
  @the_symbol = params.fetch("first_symbol").to_s

  erb(:c_one)
end
