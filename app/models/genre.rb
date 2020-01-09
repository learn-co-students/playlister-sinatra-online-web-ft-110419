class Genre < ActiveRecord::Base
  
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  
  def slug
    return self.name.gsub(' ', '-').downcase
  end
  
  def self.find_by_slug(slugified_name)
    return self.all.select do |instance|
      instance.slug == slugified_name
    end.first
  end
  
end
