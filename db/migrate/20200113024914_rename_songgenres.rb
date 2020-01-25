class RenameSonggenres < ActiveRecord::Migration[5.2]
  def change
  	rename_table :SongGenre, :songs_genres
  end
end
