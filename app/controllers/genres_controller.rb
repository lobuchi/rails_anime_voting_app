class GenresController < ApplicationController
  def index
    @genres= Genre.order(:name)
    @genres=Genre.all.order(:name)
  end
end
