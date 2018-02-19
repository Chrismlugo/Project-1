require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('../models/artist')
require_relative('../models/album')

get "/Inventory" do
 @artists = Artist.all()
 @albums = Album.all()
erb(:"/inventory/index")
end
