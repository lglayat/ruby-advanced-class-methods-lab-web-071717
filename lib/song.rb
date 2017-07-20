class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    # binding.pry
    if find_by_name(name) == nil
      create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(song_info)
    songArr = song_info.split("-")
    songArr[1] = songArr[1][1..-1]
    songArr[1] = songArr[1][0..-5]
    song = self.new
    song.name = songArr[1]
    song.artist_name = songArr[0][0..-2]
    # song.save
  #  binding.pry
    song
  end

  def self.create_from_filename(song_info)
    songArr = song_info.split("-")
    songArr[1] = songArr[1][1..-1]
    songArr[1] = songArr[1][0..-5]
    song = self.new
    song.name = songArr[1]
    song.artist_name = songArr[0][0..-2]
    song.save

    song
  end







  def self.destroy_all
    @@all = []
  end










end
