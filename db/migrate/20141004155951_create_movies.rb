class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :movie_length
      t.string :director
      t.string :rating
      t.string :imdb_url
      t.string :movie_types
      t.timestamps
      t.datetime :video_release_date
      t.datetime :release_date
    end
  end
end
