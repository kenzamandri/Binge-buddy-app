class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.integer :time
      t.integer :user_id
      t.integer :release_year
      t.string :writers
      t.string :directors
      t.string :rottentomatoes
      t.string :web_trailers
      t.string :posters
      t.string :metacritic_link
      t.string :free_web_sources
      t.string :thumbnails
      t.string :banners
      t.string :backgrounds
      t.string :overview
      t.string :purchase_web_sources
      t.string :tv_everywhere_web_sources

      t.timestamps
    end
  end
end
