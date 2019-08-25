class Artist 
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def self.all 
    @@all
  end
  
  def add_song(song) 
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
  def genres 
    self.songs.collect{|s| s.genre}.uniq
  end
  
  def self.destroy_all 
    @@all.clear
  end
  
  def save 
    @@all << self 
  end
  
  def self.create(name)
    song = new(name)
    song.save
    song
  end
  
  def songs 
    @songs
  end
end