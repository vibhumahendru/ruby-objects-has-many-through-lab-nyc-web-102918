require_relative './patient'
require_relative './appointment'

class Artist

attr_accessor :name

@@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_song(name, genre)
    Song.new(name, self, genre)
  end

  def songs
    Song.all.select do |each_song|
      each_song.artist == self
    end
  end

  def genres
    self.songs.map do |my_songs|
      my_songs.genre
    end
  end


end
