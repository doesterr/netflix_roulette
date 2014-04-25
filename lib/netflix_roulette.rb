require "net/http"
require "json"

class NetflixRoulette
  class << self
    {
      get_media_rating:       "rating",
      get_media_poster:       "poster",
      get_media_type:         "mediatype",
      get_media_release_year: "release_year",
      get_media_cast:         "show_cast",
      get_media_category:     "category",
      get_media_summary:      "summary",
      get_media_director:     "director",
      get_netflix_id:         "show_id"
    }.each_pair do |method_name, key|
      define_method method_name do |title, year = 0|
        client(title, year).fetch[key] || "Unable to locate data"
      end
    end
    
    def get_all_data(title, year = 0)
      client(title, year).fetch
    end
    
    def get_version
      Client::API_VERSION
    end
    
    private
    
    def client(title, year)
      Client.new(title, year)
    end
  end
  
  class Client
    API_URL     = URI("http://netflixroulette.net/api/api.php")
    API_VERSION = "5.0"
    
    attr_accessor :title, :year
    
    def initialize(title, year = 0)
      @title  = title
      @year   = year
    end

    def version
      API_VERSION
    end

    def fetch
      uri       = API_URL
      uri.query = URI.encode_www_form({ title: title, year: year })
      response  = Net::HTTP.get_response uri

      result = JSON.parse response.body
    end
  end
end

# nr = NetflixRoulette::Client.new "Breaking Bad"
# puts nr.fetch
# 
# puts NetflixRoulette.get_media_rating("Breaking Bad")
# puts NetflixRoulette.get_media_poster("Breaking Bad")
# puts NetflixRoulette.get_media_type("Breaking Bad")
# puts NetflixRoulette.get_media_release_year("Breaking Bad")
# puts NetflixRoulette.get_media_cast("Breaking Bad")
# puts NetflixRoulette.get_media_category("Breaking Bad")
# puts NetflixRoulette.get_media_summary("Breaking Bad")
# puts NetflixRoulette.get_media_director("Breaking Bad")
# puts NetflixRoulette.get_netflix_id("Breaking Bad")
# puts NetflixRoulette.get_all_data("Breaking Bad")