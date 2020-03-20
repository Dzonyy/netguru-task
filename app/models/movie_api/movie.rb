module MovieApi
  class Movie < Base
    property :id, type: :integer
    property :type, type: :string
    property :title, type: :string
    property :plot, type: :string
    property :rating, type: :float
    property :poster, type: :string

    def poster_url
      if poster.present?
        "https://#{ENV['MOVIE_API_HOSTNAME']}#{poster}"
      end
    end
  end
end
