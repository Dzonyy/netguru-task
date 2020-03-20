module MovieApi
  def self.hostname
    ENV['MOVIE_API_HOSTNAME']
  end
end