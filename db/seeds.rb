Song.create({name: "Parallax"})

Artist.create({name: "Atlas Sound"})

parallax = Song.find_by({name: "Parallax"})

atlas = Artist.find_by({name: "Atlas Sound"})

parallax.artist = atlas 

parallax.save

Song.create({name: "The Sound of Silence"})

Artist.create({name: "Simon and Garfunkel"})

silence = Song.find_by({name: "The Sound of Silence"})

simon = Artist.find_by({name: "Simon and Garfunkel"})

silence.artist = simon

silence.save

Song.create({name: "Water Tower"})

water = Song.find_by({name: "Water Tower"})

aes = Artist.find_by({name: "Aesop Rock"})

water.artist = aes

water.save

Artist.create({name: "Aesop Rock"})


# Add seed data here. Seed your database with `rake db:seed`

