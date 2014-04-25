require 'coveralls'
Coveralls.wear!
require "test/unit"
require "netflix_roulette"
require "webmock/test_unit"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures/vcr_cassettes"
  c.hook_into :webmock
  c.around_http_request do |request|
    VCR.use_cassette("global", record: :new_episodes, &request)
  end
end
