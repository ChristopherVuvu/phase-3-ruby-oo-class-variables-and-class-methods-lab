class Song
    attr_accessor :name, :artist, :genre
    
    @@count = 0
    @@genres = []
    @@artists = {}
    
    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre
        @@count += 1
        @@genres << genre
        @@artists[artist] ||= 0
        @@artists[artist] += 1
    end
    
    def self.count
        @@count
    end
    
    def self.genres
        @@genres.uniq
    end
    
    def self.artists
        @@artists.keys
    end
    
    def self.genre_count
        genre_count = {}
        @@genres.each do |genre|
            genre_count[genre] ||= 0
            genre_count[genre] += 1
        end
        genre_count
    end
    
    def self.artist_count
        @@artists
    end
end

ninety_nine_problems = Song.new("99 Problems", "Jay-Z", "rap")
another_song = Song.new("Song Name", "Artist Name", "rock")
# ...

puts Song.count
# Output: 2

puts Song.genres.inspect
# Output: ["rap", "rock"]

puts Song.artists.inspect
# Output: ["Jay-Z", "Artist Name"]

puts Song.genre_count.inspect
# Output: {"rap"=>1, "rock"=>1}

puts Song.artist_count.inspect
# Output: {"Jay-Z"=>1, "Artist Name"=>1}
