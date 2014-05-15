Gem::Specification.new do |s|
  s.name        = 'netflix_roulette'
  s.version     = '1.0.0'
  s.date        = '2014-04-25'
  s.summary     = "API Wrapper for Netflix Roulette"
  s.description = "A simple interface to access the Netflix Roulette API http://netflixroulette.net/api/"
  s.authors     = ["David Österreicher"]
  s.email       = 'd.oesterreicher@gmail.com'
  s.files       = ["lib/netflix_roulette.rb"]
  s.homepage    =
    'http://rubygems.org/gems/netflix_roulette'
  s.license       = 'MIT'
  s.add_development_dependency "rake"
  s.add_development_dependency "coveralls"
  s.add_development_dependency "webmock"
  s.add_development_dependency "vcr"
  s.required_ruby_version = '>= 1.9.2'
end