class MP3Importer
  attr_accessor :name,:path

  def initialize(path)
    @path=path
  end #initialize

  def files
    path = @path + "/*.mp3"
    # puts "*****#{path}"
    # files = Dir.glob("*")#Dir[path]
    files = Dir.glob(path)#Dir[path]
    # Dir["glob/**/*.rb"]
    # puts "******#{Dir["./"]}"
    # puts "******#{files.length}"
    files.map {|file| file.split("mp3s/")[1]}
    # files
  end

  def import
    # puts self.files
    files = self.files
    # puts files
    new_artists = []
    files.each do |file|
      file=file.split(" - ")
      artist_name = file[0]
      song_name = file[1]
      genre_name = file[2].split(".mp")[0]
      # puts "#{artist_name}::#{song_name}::#{genre_name}"
      a = Artist.find_or_create_by_name(artist_name)
      a.add_song(song_name)
      # a.save
      new_artists << a
    end #each
    new_artists.uniq
  end
end #class
