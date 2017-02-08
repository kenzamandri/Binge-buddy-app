class AddSearchToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :search, :string
  end
end
