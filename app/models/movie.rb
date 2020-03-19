class Movie < ApplicationRecord

  belongs_to :genre
  belongs_to :genre, counter_cache: true

  has_many :comments

  def movie_details
    begin
      MovieApi::Movie.cached_find(self.title).try(:first)
    rescue JsonApiClient::Errors::ApiError => e
      Rails.logger.error("MovieApi::Movie.cached_find(#{self.title}) threw an error: #{e.message}")
      nil
    end
  end
end