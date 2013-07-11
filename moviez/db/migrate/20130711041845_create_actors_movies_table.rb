class CreateActorsMoviesTable < ActiveRecord::Migration
  def up
    create_table :actors_movies, :id => false do |t|
      t.references :actor
      t.references :movie
    end
  end

  def down
    drop_table :actors_movies
  end
end
