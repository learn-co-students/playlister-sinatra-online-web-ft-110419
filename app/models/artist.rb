class Artist < ActiveRecord::Base 
	has_many :songs
	has_many :song_genres, through: :songs 
	has_many :genres, through: :song_genres
	def slug
		self.name.downcase.gsub(" ", "-")
	end

	def self.find_by_slug(slug)
		name = slug.gsub("-", " ")
		downcase_names = Artist.all.map{|a| [a.name.downcase, a.id]}
		found = downcase_names.find{|array| array[0] == name}
		Artist.find_by_id(found[1]) 
	end
end