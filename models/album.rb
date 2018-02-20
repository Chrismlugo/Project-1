require_relative( '../db/sql_runner' )

class Album
  attr_accessor :title, :quantity, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @quantity = options['quantity'].to_i
    @artist_id = options['artist_id'].to_i

  end

  def save()
    sql = "INSERT INTO albums(
    title,
    quantity,
    artist_id

    )
    VALUES(
      $1,$2,$3
      ) RETURNING *;"
      values = [@title, @quantity, @artist_id]
      album_info = SqlRunner.run(sql, values)
      @id = album_info.first()['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET(
    title,
    quantity,
    artist_id

    ) =
    (
      $1,$2,$3
    ) WHERE id = $4;
    "
    values = [@title, @quantity, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.update(options)
    sql = "UPDATE albums SET
    title = '#{options['title']}',
    quantity = '#{options['quantity']}',
    artist_id = '#{options['artist_id']}' WHERE id = '#{options['id']}';
    "
    SqlRunner.run(sql);
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1;"
    values = [id]
    album = SqlRunner.run(sql, values)
    result = Album.new(album.first())
    return result
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT  * FROM albums;"
    albums = SqlRunner.run(sql)
    result = albums.map{|album| Album.new(album)}
    return result
  end

  def stock_level()
    if @quantity == 0
      return "Out of Stock"
    elsif @quantity < 5
      return "Stock Low"
    elsif @quantity >= 10
      return "Stock High"
    elsif  @quantity >= 5
      return "In stock"
    end
  end



  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end
end
