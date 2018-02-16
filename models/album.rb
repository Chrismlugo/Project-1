require_relative( '../db/sql_runner' )

class Album
  attr_accessor :title, :quantity
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @quantity = options['quantity'].to_i

  end

end
