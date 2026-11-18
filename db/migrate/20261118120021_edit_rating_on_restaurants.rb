class EditRatingOnRestaurants < ActiveRecord::Migration[8.1]
  def change
    rename_column :reviews, "ratings", "rating"
  end
end
