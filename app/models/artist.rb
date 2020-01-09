class Artist < ActiveRecord::Base
  
  has_many :songs
  has_many :genres, through: :songs
  
  def slug
    return self.name.gsub(' ', '-').downcase
  end
  
  def self.find_by_slug(slugified_name)
    return self.all.select do |instance|
      instance.slug == slugified_name
    end.first
  end
  
end
