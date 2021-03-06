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
        url: "https://wrapapi.com/use/miguelfdz/metacritic_api/metacritic_movies/0.0.7",
        payload: {
          movie_title: movie_title,
          wrapAPIKey: "Vl1614u6tlwKpaJYjcuPEkXFdslYRVvX"
        }.to_json
      )

      ret = JSON.parse(result)
    end
  end
end