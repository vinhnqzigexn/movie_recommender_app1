# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161005113643) do

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.integer  "genres_value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "genres_movies", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "movie_length"
    t.string   "director"
    t.string   "rating"
    t.string   "imdb_url"
    t.string   "movie_types"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "video_release_date"
    t.datetime "release_date"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "movies_movie_genres", id: false, force: :cascade do |t|
    t.integer "movie_id"
    t.integer "movie_genre_id"
    t.index ["movie_genre_id"], name: "index_movies_movie_genres_on_movie_genre_id"
    t.index ["movie_id"], name: "index_movies_movie_genres_on_movie_id"
  end

  create_table "occupations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "sex"
    t.string   "occupation"
    t.float    "average_rating"
    t.string   "zip"
    t.integer  "age"
    t.integer  "occupation_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["occupation_id"], name: "index_users_on_occupation_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
