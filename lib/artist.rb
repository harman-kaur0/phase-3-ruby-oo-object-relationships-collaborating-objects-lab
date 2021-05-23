class Artist

    @@all = []
    attr_accessor :name
    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        if @@all.find {|artist| artist.name == name}
            @@all.find {|artist| artist.name == name}
        else
            self.new(name)
        end
    end

    def print_songs
       songs.map {|song| puts "#{song.name}"}
    end

end