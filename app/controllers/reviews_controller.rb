class ReviewsController < ApplicationController
  def index
    @reviews_number = rand(10)
    @review = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to root_path
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to reviews_path(@review)
  end

  # refactoring
  def review_params
    params.require(:review).permit(:title, :body, :score)
  end
end
