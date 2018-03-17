require 'database_cleaner'


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all
    setup do
        DatabaseCleaner.strategy = :truncation
        DatabaseCleaner.start
    end

    treadown do
        DatabaseCleaner.clean
    end
  # Add more helper methods to be used by all tests here...
end
