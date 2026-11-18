class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.text :content
      t.integer :ratings

      t.timestamps
    end
  end
end
