class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :rating
      t.text :description
      t.datetime :release_date, null: false
      t.timestamps
    end

    add_index :movies, :title
    add_index :movies, :rating
    add_index :movies, :release_date
  end
end
