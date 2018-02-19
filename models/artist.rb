require_relative( '../db/sql_runner' )

class Artist
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']


  end

  def save()
    sql = "INSERT INTO artists(
    name
    )
    Values(
      $1
      ) RETURNING *;"
      values = [@name]
      artist = SqlRunner.run(sql, values)
      @id = artist.first()['id'].to_i
  end

  def update()
    sql = "UPDATE artists SET (name) = ($1) WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [id]
    artist = SqlRunner.run(sql, values)
    result = Artist.new(artist.first())
    return result
  end

  def name()
    def self.find(name)
      sql = "SELECT * FROM artists WHERE name = $1;"
      values = [@name]
      artist = SqlRunner.run(sql, values)
      result = Artist.new(artist.first())
      return result
    end
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    artist_albums = SqlRunner.run(sql, values)
    return artist_albums.map{|artist| Album.new(artist)}
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    result = artists.map{|artist| Artist.new(artist)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)

  end
end
