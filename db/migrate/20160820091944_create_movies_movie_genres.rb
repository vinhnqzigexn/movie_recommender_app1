class CreateMoviesMovieGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :movies_movie_genres, id: false do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :movie_genre, index: true, foreign_key: true
    end
  end
end
