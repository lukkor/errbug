source "https://rubygems.org"

gem "rake"
gem "dotenv"

# Web framework
gem "dry-web", branch: 'master'
gem "dry-web-roda", ">= 0.6.0"
gem "puma"
gem "rack_csrf"

gem "rack", ">= 2.0"
gem "shotgun", ">= 0.9.2"

# Database persistence
gem "pg"
gem "rom", ">= 3.1.0"
gem "rom-repository"
gem "rom-sql", ">= 1.1.0"

# Application dependencies
gem "dry-matcher"
gem "dry-monads"
gem "dry-struct"
gem "dry-transaction"
gem "dry-types"
gem "dry-validation"
gem "dry-view", ">= 0.2.2"
gem "slim"

group :development, :test do
  gem "pry-byebug", platform: :mri
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "database_cleaner"
  gem "poltergeist"
  gem "rspec"
end
