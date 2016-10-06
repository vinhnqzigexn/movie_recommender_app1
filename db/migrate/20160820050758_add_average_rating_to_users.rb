class AddAverageRatingToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :average_rating, :float
  end
end
