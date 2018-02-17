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

end
