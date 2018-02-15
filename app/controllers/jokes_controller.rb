class JokesController < ApplicationController
  def index
    @jokes = Joke.all
  end

  def show
    @joke = Joke.find(params[:id])
  end
end
