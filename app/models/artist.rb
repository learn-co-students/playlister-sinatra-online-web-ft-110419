class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    name.downcase.gsub(" ","-")
  end

  # We can't have spaces in a URL. 
  # In order to make it a proper URL, 
  # we have to convert the spaces to - in the song name. 
  # This is a slug.

  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end

  # The find_by_slug method should use the slug method 
  # to retrieve a song/artist/genre from the database 
  # and return that entry.

end