require File.expand_path("../helpers/integration_helper", __FILE__)

RSpec.configure do |config|
  config.include IntegrationHelper, :type => :request
end