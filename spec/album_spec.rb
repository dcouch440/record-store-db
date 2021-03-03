require 'rspec'
require 'album'
require 'pry'

describe '#Album' do
  before(:each) do
    Album.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an album") do
      album = Album.new("Abbey Road", "The Beatles", "1969", "Rock", nil) # nil added as second argument
      album.save()
      album2 = Album.new("Help!", "The Beatles", "1965", "Rock", nil) # nil added as second argument
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Abbey Road", "The Beatles", "1969", "Rock", nil)
      album2 = Album.new("Abbey Road", "The Beatles", "1969", "Rock", nil)
      expect(album).to(eq(album2))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new("Abbey Road", "The Beatles", "1969", "Rock", nil)
      album.save()
      album2 = Album.new("Help!", "The Beatles", "1965", "Rock", nil)
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new("Abbey Road", "The Beatles", "1969", "Rock", nil)
      album.save()
      album2 = Album.new("Help!", "The Beatles", "1965", "Rock", nil)
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new("Let It Be", "Beatles", "1970", "Rock", nil)
      album.save()
      album.update(["Let It Be... Naked", "The Beatles"])
      expect("#{album.name}, #{album.artist}").to(eq("Let It Be... Naked, The Beatles"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new("Abbey Road", "The Beatles", "1969", "Rock", nil)
      album.save()
      album2 = Album.new("Help!", "The Beatles", "1965", "Rock", nil)
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe('.search') do
    it("returns all albums with names matching a given search string") do
      album = Album.new("Abbey Road", "The Beatles", "1969", "Rock", nil)
      album.save()
      album2 = Album.new("Help!", "The Beatles", "1965", "Rock", nil)
      album2.save()
      search_result = Album.search("Abbey road")
      expect(search_result[0] == album).to(eq(true))
    end
  end
end
