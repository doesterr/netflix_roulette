# netflix_roulette

A simple Wrapper for the Netflix Roulette API (http://netflixroulette.net/api/)

## Usage

Conventions follow the original Python Wrapper:
```ruby
NetflixRoulette.get_version
NetflixRoulette.get_media_rating("Breaking Bad")
NetflixRoulette.get_media_poster("Breaking Bad")
NetflixRoulette.get_media_type("Breaking Bad")
NetflixRoulette.get_media_release_year("Breaking Bad")
NetflixRoulette.get_media_cast("Breaking Bad")
NetflixRoulette.get_media_category("Breaking Bad")
NetflixRoulette.get_media_summary("Breaking Bad")
NetflixRoulette.get_media_director("Breaking Bad")
NetflixRoulette.get_netflix_id("Breaking Bad")
```    
    
Personally I don't like this approach for Ruby code, so the Client can also be accessed directly and always returns the entire response:

```ruby   
client = NetflixRoulette::Client.new("Breaking Bad")
breaking_bad = client.fetch
breaking_bad["rating"]
```    
    
## Installation

Add `"netflix_roulette"` gem to your Gemfile if you are using Bundler.

Or install it manually via `gem install netflix_roulette` and add `require "netflix_roulette"` to you code.
