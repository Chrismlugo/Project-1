require_relative( '../db/sql_runner' )

class Artist

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
    sql = "UPDATE artists SET (name) VALUES($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    artist = SqlRunner.run(sql, values)
    result = Artist.new(album)[0]

  end

end
