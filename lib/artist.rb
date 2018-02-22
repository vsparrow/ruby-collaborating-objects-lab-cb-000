class Artist
  attr_accessor :name,:songs
  @@all=[]

  def initialize(name)
    @name=name
    @songs = []
  end #initialize

  def add_song(song)
    @songs << song
  end

  def print_songs
    @songs.each { |s| puts s.name}
  end

  def save
    @@all << self
  end


  def self.all
    @@all
  end

  def self.create(name)
    a = Artist.new(name)
    a.save
    a

  end

  def self.find(name)
    @@all.detect {|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    a = self.find(name)
    a = self.create(name) if a.nil?
    # puts "*******#{a}"
    a
  end
end #class
