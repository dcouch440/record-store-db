class Album
  attr_reader :id #Our new save method will need reader methods.
  attr_accessor :name, :artist, :year, :genre

  @@albums = {}
  @@total_rows = 0 # We've added a class variable to keep track of total rows and increment the value when an Album is added.

  def initialize(name, artist, year, genre, id) # We've added id as a second parameter.
    @name = name
    @artist = artist
    @year = year
    @genre = genre
    @id = id || @@total_rows += 1  # We've added code to handle the id.
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.artist, self.year, self.genre, self.id)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(updates)
    @name = updates[0]
    @artist = updates[1]
    @year = updates[2]
    @genre = updates[3]
  end

  def delete
    @@albums.delete(self.id)
  end

  def self.search(search_str)
    # search_results = @@albums.select { |id, album| album.name.downcase == search_str.downcase }
    # search_results.values
    result_array = []
    @@albums.each do |id, album|
      if album.name.downcase == search_str.downcase
        result_array.push(album)
      end
    end
    result_array
  end
end
