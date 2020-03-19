class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:send_info, :export]

  def index
    @movies = Movie.all.decorate
  end

  def show
    @movie = Movie.find(params[:id]).decorate
    @comments = Comment.where(movie_id: @movie)
  end

  def send_info
    @movie = Movie.find(params[:id])
    MovieInfoMailer.send_info(current_user, movie).deliver_later
    redirect_back(fallback_location: root_path,
                  notice: "Email sent with movie info")
  end

  def export
    MovieCsvExporterJob.perform_later(current_user.id)
    redirect_back(fallback_location: root_path,
                  notice: "Movies exported")
  end
end
