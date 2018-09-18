class ReviewsController < ApplicationController

    before_action :set_review, only: [:show]
    before_action :authorize

    def new
        @movie = Movie.find(params[:movie_id])
        @review = @movie.reviews.build
    end

    def create
        @movie = Movie.find params[:movie_id]
        new_review = @movie.reviews.new(review_params)

        if new_review.save
            redirect_to movie_path(@movie)
        else
            redirect_to "new"
        end
    end

    def edit
        @review = Review.find(params[:id])
        @movie = Movie.find params[:movie_id]
    end

    def update
        @review = Review.find params[:id]
        @movie = Movie.find params[:movie_id]
        
        if @review.update(review_params)
            redirect_to movie_path(@movie)
        else
            redirect_to "edit"
        end
    end

    def destroy
        @movie = Movie.find params[:movie_id]
        @review = @movie.reviews.find params[:id]
        @review.destroy
        redirect_to movie_path(@movie)
    end

    private

        def set_review
        @review = Review.find(params[:id])
        end

        def review_params
            params.require(:review).permit(:body, :author)
        end
end