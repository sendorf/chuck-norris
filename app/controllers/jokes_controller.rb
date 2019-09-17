# frozen_string_literal: true

# Jokes controller
class JokesController < ApplicationController
  def show
    @joke = Joke.find(params[:id])
  end

  def category
    joke = Connector::ChuckNorris.category params[:value]
    redirect_to joke_path(joke)
  end

  def random
    joke = Connector::ChuckNorris.random
    redirect_to joke_path(joke)
  end
end
