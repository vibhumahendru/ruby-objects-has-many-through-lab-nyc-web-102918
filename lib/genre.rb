require_relative './artist'
require_relative './song'

class Genre

  attr_accessor :name, :artist, :genre

@@all = []
  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select do |each_song|
      each_song.genre == self
    end
  end

  def artists
    self.songs.map do |my_songs|
      my_songs.artist
    end
  end

end
