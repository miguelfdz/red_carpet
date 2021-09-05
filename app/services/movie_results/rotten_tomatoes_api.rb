require 'json'
require 'rest-client'

module MovieResults
  module RottenTomatoesApi
    def self.scrap(movie_title)
      result = RestClient::Request.execute(
        method: :post,
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json"
        },
        url: "https://wrapapi.com/use/miguelfdz/rotten_tomatoes_api/movies/latest",
        payload: {
          movie_title: self.movie_title_conversion(movie_title),
          wrapAPIKey: "Vl1614u6tlwKpaJYjcuPEkXFdslYRVvX"
        }.to_json
      )

      ret = JSON.parse(result)
    end

    def self.movie_title_conversion(movie_title)
      if movie_title.match(" ")
        movie_title.split(' ').join('_')
      else
        movie_title
      end
    end
  end
end