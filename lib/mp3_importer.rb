require 'pry'
class MP3Importer
  attr_accessor :filepath

  def initialize(filepath)
    @filepath=filepath
  end #initialize

  def path
    @filepath
  end

  # **********FILE OPERATIONS**************************************************
  def files
    # puts "********************#{@filepath}"
    search = "#{@filepath}/**/*.mp3"
    # puts "*********************#{search}"
    search_results = Dir[search]
    # puts "*********************#{search_results}"
    # puts "*********************#{search_results.length}"
    # #list all files (mp3s) in dir @filepath
    # #parse outs each mp3 into its own array element
    #   # MP3Importer #files normalizes the filename to just the mp3 filename with no path
    # puts "***********#{search_results[0]}"
    # puts "***********#{search_results[0].split("/")[-1]}"
    # puts "***********#{/\//.match(search_results[0])}"
    # search_results_formatted = search_results.collect { |path| path.split("/")[-1]}
    # search_results_formatted
    search_results.collect { |path| path.split("/")[-1]}
  end #files

  def import
    puts "***************#{self.path}"
    puts "***************#{self.files}"
    files = self.files
    files.each do |file|
      puts "***************#{file.split(" - ")}"
      file_array = file.split(" - ")
      #create songs from the file_array
      artist_name = file_array[0]
      title = file_array[1]
      genre = file_array[2].split(".mp3")
      # puts "**************genre********#{genre}"
      puts "************** ARTIST>ALL**#{Artist.all}"
      # find artist if exists, else create artist
      artist = Artist.find_or_create_by_name(artist_name)
      #create songs and add to artist
      song = Song.new(title)
      artist.add_song(song)
    end #rach

  end #import

  # def artist?(name)
  #       # artist = nil
  #       # Artist.all do |existing_artist|
  #       #   if existing_artist.name == name
  #       #     artist = existing_artist
  #       #   end #if
  #       # end #Arist.all
  #       # if artist == nil
  #       #   #create artist
  #       #   artist = Artist.new(name)
  #       # end
  #   artist = Artist.find_or_create_by_name(name)
  #       # artist = Artist.all
  #   puts "*****************artist?***artist**#{artist}"
  #   puts "*****************artist?***artist.name**#{artist.name}"
  #       # puts "*****************artist?***artist.all**#{Artist.all}"
  #   artist
  # end #artist?


end #class
