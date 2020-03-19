class MovieDecorator < Draper::Decorator
  delegate_all

  def cover_url
    object.movie_details&.poster_url
  end

  def genre_name
    object.genre&.name
  end

  def plot
    object.movie_details&.plot
  end

  def released_at
    object.released_at.to_date.to_s
  end

  def rating
    object.movie_details&.rating
  end
end
