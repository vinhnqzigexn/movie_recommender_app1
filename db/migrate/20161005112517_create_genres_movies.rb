class CreateGenresMovies < ActiveRecord::Migration
  def change
    create_table :genres_movies do |t|
      t.integer :movie_id
      t.integer :genre_id

      t.timestamps null: false
    end
  end
end
