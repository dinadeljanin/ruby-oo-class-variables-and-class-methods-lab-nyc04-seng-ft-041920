class Song

  @@count = 0
  @@artists = Array.new
  @@genres = Array.new

  attr_accessor :name, :artist, :genre

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre

    @@count += 1
    @@artists << @artist
    @@genres << @genre
  end

  def self.count
    @@count
  end

  def self.artists
    @@artists.uniq
  end

  def self.genres
    @@genres.uniq
  end

  # wishlisting this:
  # https://www.google.com/books/edition/Comprehensive_Ruby_Programming/DHg5DwAAQBAJ?hl=en&gbpv=1&dq=comprehensive+ruby+programming&printsec=frontcover
  # just for "summing values in an array using the inject method"
  def self.hash_count(arr) # cause both genres and artists will be arrays
    # arr.tally # WHY CANT WE HAVE NICE THINGS LIKE TALLY????
    arr.reduce(Hash.new(0)) { |hash, count| hash[count] += 1 ; hash } # dearly beloved semicolon acting as a separator
  end

  def self.artist_count # is a class method that returns a hash of artists and the number of songs that have those artists
    self.hash_count(@@artists)
  end

  def self.genre_count # genres_count is a class method that returns a hash of genres and the number of songs that have those genres
    self.hash_count(@@genres)
  end
end
