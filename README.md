[GV img]: https://badge.fury.io/rb/netflix_roulette.png
[BS img]: https://travis-ci.org/doesterr/netflix_roulette.png
[DS img]: https://gemnasium.com/doesterr/netflix_roulette.png
[CC img]: https://codeclimate.com/github/doesterr/netflix_roulette.png

[Gem Version]: https://rubygems.org/gems/netflix_roulette
[Build Status]: https://travis-ci.org/doesterr/netflix_roulette
[Dependency Status]: https://gemnasium.com/doesterr/netflix_roulette
[Code Climate]: https://codeclimate.com/github/doesterr/netflix_roulette

# netflix_roulette
[![Gem Version][GV img]][Gem Version]
[![Build Status][BS img]][Build Status]
[![Dependency Status][DS img]][Dependency Status]
[![Code Climate][CC img]][Code Climate]

A simple Wrapper for the Netflix Roulette API (http://netflixroulette.net/api/)

## Usage

Conventions follow the original Python Wrapper:
```ruby
NetflixRoulette.get_version
#=> "5.0"

NetflixRoulette.get_media_rating("Breaking Bad")
#=> "4.5"

NetflixRoulette.get_media_poster("Breaking Bad")
#=> "http://cdn-2.nflximg.com/en_us/boxshots/ghd/70143836.jpg"

NetflixRoulette.get_media_type("Breaking Bad")
#=> 1

NetflixRoulette.get_media_release_year("Breaking Bad")
#=> "2008"

NetflixRoulette.get_media_cast("Breaking Bad")
#=> "Bryan Cranston, Anna Gunn, Aaron Paul, Betsy Brandt, R.J. Mitte, Dean Norris, Bob Odenkirk, Steven Michael Quezada, Jonathan Banks, Giancarlo Esposito"

NetflixRoulette.get_media_category("Breaking Bad")
#=> "Dramas\n"

NetflixRoulette.get_media_summary("Breaking Bad")
#=> "Emmy winner Bryan Cranston stars as Walter White, a high school science teacher who learns that he has terminal lung cancer and teams with a former student to manufacture and sell high-quality crystal meth to secure his family's future."

NetflixRoulette.get_media_director("Breaking Bad")
#=> ""

NetflixRoulette.get_netflix_id("Breaking Bad")
#=> 70143836
```    
    
Personally I don't like this approach for Ruby code, so the Client can also be accessed directly and always returns the entire response as a Hash:

```ruby   
client = NetflixRoulette::Client.new("Breaking Bad")
#=> #<NetflixRoulette::Client:0x007fd8ac1c5de0 @title="Breaking Bad", @year=0>

breaking_bad = client.fetch
#=> {"unit"=>6545, "show_id"=>70143836, "show_title"=>"Breaking Bad", "release_year"=>"2008", "rating"=>"4.5", "category"=>"Dramas\n", "show_cast"=>"Bryan Cranston, Anna Gunn, Aaron Paul, Betsy Brandt, R.J. Mitte, Dean Norris, Bob Odenkirk, Steven Michael Quezada, Jonathan Banks, Giancarlo Esposito", "director"=>"", "summary"=>"Emmy winner Bryan Cranston stars as Walter White, a high school science teacher who learns that he has terminal lung cancer and teams with a former student to manufacture and sell high-quality crystal meth to secure his family's future.", "poster"=>"http://cdn-2.nflximg.com/en_us/boxshots/ghd/70143836.jpg", "mediatype"=>1}

breaking_bad["rating"]
#=> "4.5"

```    
    
## Installation

Add `"netflix_roulette"` gem to your Gemfile if you are using Bundler.

Or install it manually via `gem install netflix_roulette` and add `require "netflix_roulette"` to you code.
