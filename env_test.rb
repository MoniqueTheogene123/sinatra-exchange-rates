# /env_test.rb
require "dotenv/load"

pp ENV.fetch("EXCRATES_KEY")
