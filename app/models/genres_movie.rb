class GenresMovie < ApplicationRecord
  belongs_to :movie, dependent: :destroy
  belongs_to :genre, dependent: :destroy
end
