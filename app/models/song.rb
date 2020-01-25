class Song < ActiveRecord::Base
	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres
	def slug
		self.name.downcase.gsub(" ", "-")
	end

	def self.find_by_slug(slug)
		name = slug.gsub("-", " ")
		downcase_names = Song.all.map{|s| [s.name.downcase, s.id]}
		found = downcase_names.find{|array| array[0] == name}
		Song.find_by_id(found[1]) 
	end
end