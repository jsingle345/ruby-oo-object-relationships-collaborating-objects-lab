require "pry"

class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end
    
    def self.all
        @@all
    end

    def add_song(song)
        @songs << song
    end

    # binding.pry

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def self.find_or_create_by_name(new_artist)
        discover_artist = self.all.find do |performer|
            performer.name == new_artist
            end
            if discover_artist
            discover_artist
            else 
                new_artist = self.new(new_artist)
                @@all << self
                new_artist
            end
    end

    def print_songs
        @songs.each do |song|
            puts song.name
        end
    end
end





   