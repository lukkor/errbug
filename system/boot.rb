require "byebug" if ENV["RACK_ENV"] == "development"
require "pry" if ENV["RACK_ENV"] == "development"

require "dotenv/load"

require_relative "errbug/container"

Errbug::Container.finalize! do |container|
end

app_paths = Pathname(__FILE__).dirname.join("../apps").realpath.join("*")
Dir[app_paths].each { |f| require "#{f}/system/boot" }

require_relative "errbug/application"
