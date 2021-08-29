class CreateMovieResults < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_results do |t|
      t.string :movie_title
      t.timestamps
    end
  end
end
