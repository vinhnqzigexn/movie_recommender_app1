class Movielen
  class << self
  def insert_all
    insert_users
    insert_movies
    insert_ratings
  end
  def insert_users file_path = "app/models/import/recommender_system/movie_data/u.user"
    User.delete_all
    password = "password"
    file = Rails.root.join(file_path)
    f = open(file, 'r')
    f.each do |user_line|
      user_array = user_line.split('|')
      if user_array.length == 5
        user_db = User.new(id: user_array[0], email: "example-#{user_array[0]}@recommender.org", password: password, age: user_array[1],
          sex: user_array[2], occupation: user_array[3], average_rating: user_array[4])
        user_db.save!
      end
    end
  end

  def read_users file = nil
    users = []
    file ||= Rails.root.join("app/models/import/recommender_system/movie_data/u.user")
    f = open(file, 'r')
    f.each do |user_line|
      user_array = user_line.strip.split.map(&:to_i)
      users << user_array
    end
    users
  end

  def read_movies file = nil
    file ||= Rails.root.join("app/models/import/recommender_system/movie_data/u.item")
    f = open(file, 'r')
    movie_genres = []
    f.each do |item_line|
      es = item_line.force_encoding("ISO-8859-1").encode("utf-8", replace: nil).strip.split('|')
      if es.length == 24
        movie_genres << es;
      end
    end
    movie_genres
  end

  def insert_movies file = "app/models/import/recommender_system/movie_data/u.item"
    Movie.delete_all
    file = Rails.root.join(file)
    f = open(file, 'r')
    Movie.delete_all
    Genre.delete_all
    movie_genres = []
    genre_names = %w(unknown Action Adventure Animation Children's Comedy Crime Documentary Drama Fantasy Film-Noir Horror Musical Mystery Romance Sci-Fi Thriller War Western)

    f.each do |item_line|

      es = item_line.force_encoding("ISO-8859-1").encode("utf-8", replace: nil).strip.split('|')
      movie_types = ""
      if es.length == 24
        movie_db = Movie.new(:id => es[0], :title => es[1],
                              :release_date => es[2],
                              :video_release_date => es[3],
                              :imdb_url => es[4])
        if es[5] == 1
          movie_db.genres << Genre.new(name: genre_names[0], genres_value: 0)
        else
          (6..23).each do |i|
            if es[i].to_i != 0
              movie_db.genres.build(genres_value: i - 5, name: genre_names[i-5])
            end
          end
        end
        movie_db.save!
      end
    end
  end

  def read_ratings file = nil
    result = []
    file ||= Rails.root.join("app/models/import/recommender_system/movie_data/u.base")
    open(file, 'r').each do |line_rating|
      rating = line_rating.strip.split.map(&:to_i)
      result << rating
    end
    result
  end

  def insert_ratings file_path = "app/models/import/recommender_system/movie_data/u.base"
    Review.delete_all
    file = Rails.root.join(file_path)
    open(file, 'r').each do |line_rating|
      rating = line_rating.strip.split
      review = Review.new(:user_id => rating[0], :movie_id => rating[1],
                          :rating => rating[2])
      review.save!
    end
  end
end
end
