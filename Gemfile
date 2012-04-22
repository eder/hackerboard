source :rubygems

gem "rails", "3.2.3"
gem "mysql2"
gem "paginate"
gem "responders"
gem "thinking-sphinx"

group :production do
  gem "unicorn"
end

group :development, :test do
  gem "rspec-rails"
  gem "capistrano"
  gem "capistrano_colors"
end

group :test do
  gem "capybara"
  gem "factory_girl"
  gem "factory_girl-preload"
  gem "launchy"
  gem "test_notifier", :require => "test_notifier/runner/rspec"
  gem "autotest-standalone"
end

group :development do
  gem "awesome_print"
  gem "pry"
  gem "mailcatcher"
end
