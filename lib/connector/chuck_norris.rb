# frozen_string_literal: true

module Connector
  # Chuck Norris connector
  class ChuckNorris
    BASE_URL = 'https://api.chucknorris.io/jokes/'

    class << self
      def category(category)
        joke = JSON.parse(get("#{BASE_URL}random?category=#{category}"))
        find_create_joke(joke)
      end

      def random
        joke = JSON.parse(get("#{BASE_URL}random"))
        find_create_joke(joke)
      end

      def query(query)
        jokes = []
        joke_ids = []
        api_jokes = JSON.parse(get("#{BASE_URL}search?query=#{CGI.escape(query)}"))['result']
        api_jokes.each do |api_joke|
          joke = find_create_joke(api_joke)
          joke_ids << joke.id
          jokes << joke
        end
        search = Search.find_or_create_by(query: query)
        search.joke_ids = joke_ids
        search.save!
        jokes
      end

      private

      def get(url)
        url = URI.parse(url)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url.request_uri)

        response = http.request(request)
        response.body
      end

      def find_create_joke(api_joke)
        joke = Joke.find_or_create_by(
          api_id: api_joke['id'],
          api_url: api_joke['url'],
          body: api_joke['value']
        )
        assign_categories(joke, api_joke)
      end

      def assign_categories(joke, api_joke)
        category_ids = []
        api_joke['categories'].each do |category|
          category_ids << Category.find_or_create_by(value: category).id
        end
        joke.category_ids = category_ids
        joke.save!
        joke
      end
    end
  end
end
