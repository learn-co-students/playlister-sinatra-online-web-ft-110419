class SongGenre < ActiveRecord::Base
    belongs_to :genre
    belongs_to :song

    # def slug 
    #     self.name.gsub(" ", "-").downcase
    # end 

    # def self.find_by_slug(slug)
    #     self.all.find{|i| i.slug == slug}
    # end 

end 