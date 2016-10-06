class MovieGenresController < ApplicationController
  before_action :set_movie_genre, only: [:show, :edit, :update, :destroy]

  # GET /movie_genres
  # GET /movie_genres.json
  def index
    @movie_genres = MovieGenre.all
  end

  # GET /movie_genres/1
  # GET /movie_genres/1.json
  def show
  end

  # GET /movie_genres/new
  def new
    @movie_genre = MovieGenre.new
  end

  # GET /movie_genres/1/edit
  def edit
  end

  # POST /movie_genres
  # POST /movie_genres.json
  def create
    @movie_genre = MovieGenre.new(movie_genre_params)

    respond_to do |format|
      if @movie_genre.save
        format.html { redirect_to @movie_genre, notice: 'Movie genre was successfully created.' }
        format.json { render :show, status: :created, location: @movie_genre }
      else
        format.html { render :new }
        format.json { render json: @movie_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie_genres/1
  # PATCH/PUT /movie_genres/1.json
  def update
    respond_to do |format|
      if @movie_genre.update(movie_genre_params)
        format.html { redirect_to @movie_genre, notice: 'Movie genre was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie_genre }
      else
        format.html { render :edit }
        format.json { render json: @movie_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_genres/1
  # DELETE /movie_genres/1.json
  def destroy
    @movie_genre.destroy
    respond_to do |format|
      format.html { redirect_to movie_genres_url, notice: 'Movie genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_genre
      @movie_genre = MovieGenre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_genre_params
      params.require(:movie_genre).permit(:unknown, :action, :adventure, :animation, :childrens, :comedy, :crime, :documentary, :drama, :fantasy, :film_noir, :horror, :musical, :mystery, :romance, :sci_fi, :thriller, :war, :western, :movies)
    end
end
