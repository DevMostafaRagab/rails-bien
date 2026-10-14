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
    if @review.save
      redirect_to root_path, notice: "Event was successfully created."
    else
      # render :new, status: :unprocessable_entity
      render "new"
    end
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
    if @review.update(review_params)
      # redirect to someware new
      redirect_to reviews_path(@review)
    else
      render "edit"
    end
  end

  # refactoring
  def review_params
    params.require(:review).permit(:title, :body, :score)
  end
end
