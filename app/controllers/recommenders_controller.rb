class RecommendersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def intialize
    @similarity_users = nil
  end

  def index
    @movies = Movie.all.sample(10)
  end

  def rate
    if params[:rating] && params[:comment]
      @similarity_users ||= $recommender.recommend params[:rating], current_user.id
    end
    redirect_to recommenders_show_path
  end

  def show
    if $recommender.similar_users
      @similarity_users = $recommender.similar_users
      movie_ids = Review.where("user_id in (#{@similarity_users.join(',')})").pluck(:movie_id).uniq
      @movies = Movie.where("id in (#{movie_ids.join(',')})").first(30)
    end
  end

end
