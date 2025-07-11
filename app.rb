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

get("/:from_currency") do
  @from = params.fetch("from_currency")

  
  @url = "https://api.exchangerate.host/list?access_key=3f7fcf1d090548ea5f5ab1de8c9c6a4f"

  @raw_response = HTTP.get(@url)
  
  @string_response = @raw_response.to_s
  
  @parsed_response = JSON.parse(@string_response)
  
  @currencies = @parsed_response.fetch("currencies")

  erb(:step_one)
end

get("/:from_currency/:to_currency") do
  @from = params.fetch("from_currency")
  @to = params.fetch("to_currency")

  @url = "https://api.exchangerate.host/convert?from=#{@from}&to=#{@to}&amount=1&access_key=3f7fcf1d090548ea5f5ab1de8c9c6a4f"

  @raw_response = HTTP.get(@url)

  @string_response = @raw_response.to_s

  @parsed_response = JSON.parse(@string_response)

  @amount = @parsed_response.fetch("result")

  erb(:step_two)
end
