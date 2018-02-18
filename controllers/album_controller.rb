require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('../models/album')

# index
get "/inventory" do
  @albums = Album.all()
  erb(:"albums/index")
end

#show
get "/albums/:id" do
  @album = Album.find(params['id'].to_i)
end
