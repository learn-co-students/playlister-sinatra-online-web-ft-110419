class Genre < ActiveRecord::Base
	has_many :song_genres
	has_many :songs, through: :song_genres
	has_many :artists, through: :songs
	def slug
		self.name.downcase.gsub(" ", "-")
	end
	def self.find_by_slug(slug)
		name_array = slug.split("-")
		name = name_array.map{|word| word.capitalize}.join(" ")
		self.find_by_name(name)
	end
end