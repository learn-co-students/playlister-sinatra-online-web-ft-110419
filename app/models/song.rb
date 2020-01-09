class Song < ActiveRecord::Base
  
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  def slug
    return self.name.gsub(' ', '-').downcase
  end
  
  def self.find_by_slug(slugified_name)
    return self.all.select do |instance|
      instance.slug == slugified_name
    end.first
  end
  
end
