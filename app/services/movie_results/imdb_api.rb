require 'json'
require 'rest-client'

module MovieResults
  module ImdbApi
    def self.scrap(movie_title)
      result = RestClient::Request.execute(
        method: :post,
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json"
        },
        url: "https://wrapapi.com/use/Aurora00/imdb_api/movies1/0.0.2",
        payload: {
          title: movie_title,
          wrapAPIKey: "SCJnkttzABo189MkVeQJjhwLST0QCIuf"
        }.to_json
      )

      ret = JSON.parse(result)
    end
  end
end