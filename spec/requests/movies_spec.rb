require "rails_helper"

describe Movie do
  let!(:movie) { create(:movie) }
  it 'has stubbed movie_details' do
    expect(movie.movie_details).to be_present
    expect(movie.movie_details).to be_instance_of(MovieApi::Movie)
    expect(movie.movie_details.poster_url).to be_present
    expect(movie.movie_details.poster_url).to include('/godfather.jpg')
  end
end