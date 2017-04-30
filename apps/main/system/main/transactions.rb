require "dry-transaction"
require "errbug/transactions"
require "main/container"
require "main/import"

module Main
  class Transactions < Errbug::Transactions
    configure do |config|
      config.container = Main::Container
    end
  end
end
