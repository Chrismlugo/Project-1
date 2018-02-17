require_relative( '../db/sql_runner' )

class Album
  attr_accessor :title, :quantity
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @quantity = options['quantity'].to_i

  end

  def save()
    sql = "INSERT INTO albums(
    title,
    quantity
    )
    VALUES(
      $1,$2
      ) RETURNING *;"
      values = [@title, @quantity]
      album_info = SqlRunner.run(sql, values)
      @id = album_info.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT  * FROM albums;"
    albums = SqlRunner.run(sql)
    result = albums.map{|album| Album.new(album)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM albums:"
    SqlRunner.run(sql)
  end
end
