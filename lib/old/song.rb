require_relative "artist"

class Song
  attr_accessor :title, :artist,    :name
  # attr_reader :artist

  def initialize(title)
    @title=title
    @name=title
  end #initialize

  # def name
  #   @title
  # end
  #
  # def name=(newname)
  #   @title=newname
  # end
  # def self.name
  #   @name
  # end

  def self.new_by_filename(file_name)
    puts "******************#{file_name}"#{******************Michael Jackson - Black or White - pop.mp3}
    song_array=file_name.split(" - ")
    artist_name = song_array[0]
    title = song_array[1].split(".mp3")[0]
    # puts "*******************#{artist}***#{title}"
    song = Song.new(title)
    # song.artist = artist_name
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(song)
    song.artist =artist
    song
  end

  # def artist=(artist)
  #
  # end
end #class

mysong = Song.new_by_filename("Michael Jackson - Black or White - pop.mp3")
puts "#{mysong }"
puts "#{mysong.artist}"
# puts "Song.name:#{Song.name}"
# mysong.name="cool"
puts "Song.name:#{mysong.name}"
# puts "#{mysong.name}"
