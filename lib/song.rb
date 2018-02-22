class Song
  attr_accessor :name,:artist

  def initialize(name,artist=nil)
    @name=name
    @artist=artist
  end #initialize

  def self.new_by_filename(filename)
    # puts "*****#{filename.split(" - ")[1]}"
    file=filename.split(" - ")
    artist_name = file[0]
    song_name = file[1]
    genre_name = file[2].split(".mp")[0]
    s = Song.new(song_name)
    # puts "******#{s}"
    s.artist=Artist.find_or_create_by_name(artist_name)
    s
  end

end #class
