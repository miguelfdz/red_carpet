require 'json'
require 'rest-client'

module MovieResults
  module MetacriticApi

    def self.scrap(movie_title)
      result = RestClient::Request.execute(
        method: :post,
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json"
        },
        url: "https://wrapapi.com/use/miguelfdz/metacritic_api/metacritic_movies/0.0.1",
        payload: {
          movie_title: movie_title,
          wrapAPIKey: "1RpZy0eQGTZgSaJArpszYkJ0CIMrvqLS"
        }.to_json
      )

      ret = JSON.parse(result)
    end

    def movie_title_conversion(movie_title)
      if movie_title.match(" ")
        movie_title.split(' ').join('%20')
      else
        movie_title
      end
    end
  end
end