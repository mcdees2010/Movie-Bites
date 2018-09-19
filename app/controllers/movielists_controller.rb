class MovielistsController < ApplicationController

    def index
        if params[:search] #if a user has searched for a movie
            sanitized = params[:search].split.map { |i| i.capitalize }.join(' ') #turn what the user searched in capitalized words by each element in an array
            @movies = Movie.where("title LIKE ? ", "%#{sanitized}%") #queries movies searched by the sanitized parameter, finding a similar title

        else
            @movies = Movie.all
        end
    end
end