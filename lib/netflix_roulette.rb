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
      get_netflix_id:         "show_id",
      get_runtime:            "runtime"
    }.each_pair do |method_name, key|
      define_method method_name do |title, year = 0|
        client(title: title, year: year).fetch[key] || "Unable to locate data"
      end
    end
    
    def get_all_data(title, year = 0)
      client(title: title, year: year).fetch
    end
    
    def get_media_for_actor(actor)
      client(actor: actor).fetch
    end
    
    def get_media_for_director(director)
      client(director: director).fetch
    end
    
    def get_version
      Client::API_VERSION
    end
    
    private
    
    def client(query)
      Client.new query
    end
  end
  
  class Client
    API_URL     = URI("https://netflixroulette.net/api/api.php")
    API_VERSION = "5.0"
    
    def initialize(query = {})
      { year: 0 }.merge(query) if query.has_key? :title
      
      @query = query
    end

    def version
      API_VERSION
    end

    def fetch
      uri       = API_URL
      uri.query = URI.encode_www_form @query
      response  = Net::HTTP.get_response uri

      result = JSON.parse response.body
    end
  end
end
