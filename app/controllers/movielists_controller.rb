class MovielistsController < ApplicationController

    def index
        @movielists = Movielist.all
        @movies = Movie.all
    end
end