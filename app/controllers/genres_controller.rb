class GenresController < ApplicationController
  expose_decorated(:genre)
  expose_decorated(:genres) { Genre.all }
end
