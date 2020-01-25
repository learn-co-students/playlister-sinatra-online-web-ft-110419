class GenresSongs < ActiveRecord::Migration[5.2]
  def change
  	create_table :SongGenre do |table|
  		table.integer :song_id
  		table.integer :genre_id
  	end
  end
end
