module MovieApi
  class Base < JsonApiClient::Resource
    self.site = "https://#{MovieApi.hostname}/api/v1/"

    def self.cached_find(*args)
      Rails.cache.fetch("MovieApi::#{self.class}.find/#{args.join('/')}", expires_in: 1.hour) do
        find(*args)
      end
    end
  end
end
