class Artist
  attr_accessor :name,:songs
  @@all ||= []
  def initialize(name)
    @name=name
    @songs=[]
    # @@all ||= []

  end #initialize

  def add_song(song)
    @songs << song
  end

  def self.all
    puts "**************CLASS-ARTIST-method-ALL-was called #{@@all}"
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    artist=nil
    @@all.each do |artist_existing|
      # puts  "***************#{artist_existing.name}"
      if artist_existing.name == name       #   is artist in @all
        artist = artist_existing            #   if in all return artist
        break
      end #end if
    end #each
    if artist.nil?
      artist = Artist.new(name)  #  if not in all create artist
      artist.save
    end

    artist
  end #find_or_create_by_name

  def print_songs
    songs.each {|song| puts "#{song.title}"}
  end # print_songs
end #class
